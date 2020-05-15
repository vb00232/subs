require 'elasticsearch/model'

module Searchable
 extend ActiveSupport::Concern

 included do
   # Automatically update Elasticsearch index based on model changes
   include Elasticsearch::Model
   # Automatically injects the callback subscribers, e.g after_save
   include Elasticsearch::Model::Callbacks

   # Custom indexing
   def as_indexed_json(options = {})
   self.as_json(
     # Fields used to identify a product
     only: [:id, :name, :description, :price],
   )
   end

   # Index configuration
   settings index: { analysis: {
     analyzer: {
       # Define a custom analyzer
       product_analyzer: {
         type: :custom,

         # Standard tokenizer
         tokenizer: :standard,
         # Apply token filters
         filter: %i[lowercase autocomplete],
         char_filter: %i[punctuation]
       },
       filter: {
         # Defining a custom token filter
         autocomplete: {
           # Splits text into n-grams
           type: :edge_ngram,
           min_gram: 2,
           max_gram: 25
         }
       },
       char_filter: {
         punctuation: {
           type: :mapping,
           mappings: [".=>"]
         }
       }
     }
     } } do
     mappings dynamic: false do
       # Use name as an index with the custom analyzer
       indexes :name, type: :text, analyzer: :product_analyzer
       indexes :description, type: :text, analyzer: :product_analyzer
     end
   end

   def self.search_query(query)
     # Adds conditions to a search definition
     set_filters = lambda do |context_type, filter|
       @search_definition[:query][:bool][context_type] |= [filter]
     end

     @search_definition = {
       # Defines an empty query
       query: {
           bool: {
             must: [],
             should: [],
             filter: []
           }
         }
       }

     if query.blank?
       set_filters.call(:must, match_all: {})
     else
       set_filters.call(
         :must,
         match: {
           name: {
             query: query,
             # Number of typos that can be made
             fuzziness: 1
           }
         })
     end

     Product.__elasticsearch__.search(@search_definition).results
   end

  end

end
