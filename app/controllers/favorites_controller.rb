class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.build(quote_id: params[:quote_id])
    favorite.save
    redirect_to quotes_path
  end

  def destroy
    favorite = Favorite.find_by(quote_id: params[:quote_id], user_id: current_user.id)
    favorite.destroy
    redirect_to quotes_path
  end
end
