class QuotesController < ApplicationController

  def index
    @quotes = Quote.all.order('created_at DESC')
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

  private
  def quote_params
    params.require(:quote).permit(:title, :citation, :explanation).merge(user_id: current_user.id)
  end

end
