class MainController < ApplicationController

  def main
    # Keyword from search bar
    @query = params[:query]

    # Checks if search query is present
    if @query
      @products = Array.new

      #Search based upon selected indexed fields
      @queryResults = Product.search_query(@query)

      # ElasticSearch returns products as JSON
      # Retrieves products from the database using their id
      @queryResults.each do |result|
        @products.append(Product.product_id(result.id).first)
      end

    # If no query, display all products
    else
      @products = Product.all
    end
  end

end
