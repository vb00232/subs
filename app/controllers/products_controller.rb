class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :show ]

  # GET /products
  # GET /products.json

  def index
    query = params[:query]
    # Checks if search query is present
    if query
      @products = Product.search(params[:query], page: params[:page])
    else
      @products = Product.all
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
    @userListings = Product.user_products(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user = current_user

    respond_to do |format|
      if @product.save
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
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :description, :image)
    end
end
