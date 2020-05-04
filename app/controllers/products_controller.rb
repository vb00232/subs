class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, except: [ :show ]

  # GET /products
  # GET /products.json

  def index
    # Gets a list of all categories
    categories = Category.all
    @categoryNames = Array.new
    for c in categories do
      @categoryNames.append(c.name)
    end
    if @categoryNames.empty?
      @categoryNames.append("Run rake:db seed in console to load categories")
    end

    # Keyword from search bar
    query = params[:query]
    sort = params[:sort]

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

    user = params[:user]
    if user
      @products = Product.user_products(user)
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

  end

  # def index
  #   query = params[:query]
  #   # Checks if search query is present
  #   if query
  #     #Search for multi-query fields on the selected indexed fields
  #     response = Product.__elasticsearch__.search(
  #       query: {
  #         multi_match: {
  #           query: params[:query],
  #           fields: ['name', 'description', 'price']
  #         }
  #       }
  #     ).results
  #
  #     # JSON layout to display products
  #     render json: {
  #       results: response.results,
  #       total: response.total
  #     }
  #   # If no query, displays a user's products
  #   else
  #     @products = Product.user_products(current_user)
  #   end
  # end

  def search_query(query)
    self.__elasticsearch__.search(
      query: {
        multi_match: {
          query: params[:query],
          fields: ['name', 'description']
        }
      }
    ).results
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # Finds ProductCategory relations for the product
    productsCategories = ProductCategory.find_category(@product.id)
    # Category names
    @categories = []
    for c in productsCategories do
      cat = Category.find_by_id(c.category)
      unless cat.empty?
        @categories.append(cat.first)
      end
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @categories = Category.all

    respond_to do |format|
      if @product.save
        # Adds a product's categories to database
        if params.has_key?(:categories_selected)
          # Gets categories from url parameters
          categories_selected = params[:categories_selected][:selected]
          for c in categories_selected do
            # Finds a category based upon its id given in params
            cat = Category.find_by_id(c).first
            # Creates a new category
            productCategory = ProductCategory.new(product: @product, category: cat)
            productCategory.save
          end
        end

        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    product = Product.find(params[:id])
    # Updates a product's category
    if params.has_key?(:categories_selected)
      categories_selected = params[:categories_selected][:selected]
      ProductCategory.where(product: product).destroy_all
      for c in categories_selected do
          productCategory = ProductCategory.new(product: product, category: c)
          productCategory.save
      end
    end

    if product.update(product_params)
      redirect_to products_path
    else
      flash[:errors] = product.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :description, :category, :image)
    end
end
