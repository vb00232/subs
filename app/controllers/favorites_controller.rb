class FavoritesController < ApplicationController

  def index
    if params.has_key?(:product)
      product_id = params[:product]
      # Finds the product
      product = Product.product_id(product_id).first
      if product && product != ""
        product_wish_list = Favorite.find_user(current_user).find_product(product.id)
        if product_wish_list == []
          fav = Favorite.new(product: product, user: current_user)
          fav.save
        else
          product_wish_list.each do |prod|
            prod.destroy
          end
        end
      end
    end
    @favorites = Favorite.all.where(user: current_user)
  end

  def show
    @favorite_exists = Favorite.where(product: Product.find(params[:product]), user: current_user) ==[] ? false :true
  end

  def create

  end

  def update
     favorite = Favorite.where(product: Product.find(params[:id]), user: current_user)
     if favorite == []
       #create the fav
       Favorite.create(product: Product.find(params[:product]), user: current_user)
       @favourite_exists = true
     else
       #delete the fav
       favorite.destroy_all
        @favourite_exists = false
  end
  respond_to do |format|
    format.html {}
    format.js {}
  end
end
end
