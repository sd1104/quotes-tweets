class UsersController < ApplicationController

  def index
  end
  
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @quotes = user.quotes.order('created_at DESC')
  end

end
