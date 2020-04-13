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

   def self.search_query(query)
     Product.__elasticsearch__.search(
       query: {
         multi_match: {
           query: query,
           fields: ['name', 'description']
         }
       }
     ).results
   end

 end
end
