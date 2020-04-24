class FavoritesController < ApplicationController
  def show
      @favorite_exists = Favorite.where(product: Product.find(params[:id]), user: current_user) ==[] ? false :true
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
