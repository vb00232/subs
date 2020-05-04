class FavoritesController < ApplicationController

  def index
    if params.has_key?(:product)
      product_id = params[:product]
      product = Product.product_id(product_id).first
      fav = Favorite.new(product: product, user: current_user)
      fav.save
    end
    @favorites = Favorite.all.where(user: current_user)
  end

  def show
    # Make sure your parameters names match
    # I've changed params[:id] to [:product] as this is what you're passing
    # in the link_to tag
    @favorite_exists = Favorite.where(product: Product.find(params[:product]), user: current_user) ==[] ? false :true
  end

  def create

  end

  def update
     favorite = Favorite.where(product: Product.find(params[:id]), user: current_user)
     if favorite == []
       #create the fav
       Favortie.create(product: Product.find(params[:product]), user: current_user)
       @favortie_exists = true
     else
       #delete the fav
       favorite.destroy_all
        @favortie_exists = false
  end
  respond_to do |format|
    format.html {}
    format.js {}
  end
end
end
