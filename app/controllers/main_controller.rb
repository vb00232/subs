class MainController < ApplicationController

  def main
    # Gets category names for drop down
    categories = Category.all
    @categoryNames = Array.new
    for c in categories do
      @categoryNames.append(c.name)
    end
    if @categoryNames.empty?
      @categoryNames.append("Run rake db:seed in command line")
    end

    # Keyword from search bar
    query = params[:query]
    # Price / new listing sorting filter
    sort = params[:sort]
    # Category filter
    cat = params[:category]

    # Checks if search query is present
    if query && query != ""
      @products = Array.new

      #Search based upon selected indexed fields
      queryResults = Product.search_query(query)

      # ElasticSearch returns products as JSON
      # Retrieves products from the database using their id
      queryResults.each do |result|
        @products.append(Product.product_id(result.id).first)
    end

    # If no query, display all products
    else
      @products = Product.all
    end

    if sort == t('sortby.lowtohigh')
      @products = @products.order("products.price ASC")
    elsif sort == t('sortby.hightolow')
      @products = @products.order("products.price DESC")
    elsif sort == t('sortby.newlistings')
      @products = @products.order("products.created_at DESC")
    elsif sort == t('sortby.oldlistings')
      @products = @products.order("products.created_at ASC")
    end

    # Checks that a category is present in url and that one has been selected
    if cat && cat != t('categories.unselected')
      # Finds the category record using the name passed in by the url
      category_record = Category.find_by_name(cat).first
      new_products = []
      # Iterates through all products found so far
      for product in @products
        # Finds categories associated with each product
        product_cats = ProductCategory.find_category(product)
        flash[:alert] = product_cats.size
        for c in product_cats
          if c.category == category_record
            new_products.append(product)
          end
        end
      end
      @products = new_products
    end


  end

end
