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

   # def self.search_query(query)
   #   Product.__elasticsearch__.search(
   #     query: {
   #       multi_match: {
   #         query: query,
   #         fields: ['name', 'description']
   #       }
   #     }
   #   ).results
   # end

   settings index: { number_of_shards: 1 } do
     mappings dynamic: false do
       # Use the custom autocomplete analyzer
       indexes :name,  type: :text, analyzer: :autocomplete
       #indexes :description, type: :text
     end
   end

   # def settings_attributes
   #
   #   index: {
   #     analysis: {
   #       analyzer: {
   #         # Define a custom analyzer
   #         autocomplete: {
   #           # Type is custom analyzer
   #           type: :custom,
   #           # Standard tokenizer
   #           tokenizer: :standard,
   #           # Apply two lowercase and autocomplete token filters
   #           filter: %i[lowercase autocomplete]
   #         },
   #         filter: {
   #           # Defining a custom token filter
   #           autocomplete: {
   #             type: :edge_ngram,
   #             min_gram: 2,
   #             max_gram: 25
   #           }
   #         }
   #       }
   #     }
   #   }
   #
   # end

   def self.search_query(query)
     # Sets search filters
     set_filters = lambda do |context_type, filter|
       @search_definition[:query][:bool][context_type] |= [filter]
     end

     @search_definition = {
         size: 5,
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
             fuzziness: 1
           }
         })
     end

     # if filters[:description].present?
     #   set_filters.call(:filter, term: { description: filters[:description] })
     # end

     Product.__elasticsearch__.search(@search_definition).results
   end

  end

end
