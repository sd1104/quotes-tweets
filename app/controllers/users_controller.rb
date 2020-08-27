class UsersController < ApplicationController

  def index
  end
  
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @quotes = user.quotes.order('created_at DESC')
  end

  def favorite
    @user = User.find(current_user.id)
    @quotes = @user.quotes
    @favorite_quotes = @user.favorite_quotes
  end

  def follows
    user = User.find(current_user.id)
    @users = user.followings
  end

  def followers
    user = User.find(current_user.id)
    @users = user.followers
  end

end
