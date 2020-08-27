class QuotesController < ApplicationController

  def index
    @quotes = Quote.includes(:comments).order('created_at DESC')
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @quote = Quote.find(params[:id])
    @comment = Comment.new
    @comments = Comment.includes(:user)
  end

  private
  def quote_params
    params.require(:quote).permit(:title, :citation, :explanation).merge(user_id: current_user.id)
  end

end