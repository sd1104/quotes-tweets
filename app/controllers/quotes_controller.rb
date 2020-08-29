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
    @comments = Comment.includes(:user).where(quote_id: params[:id]).order("created_at DESC")
  end

  def tag
    @user = current_user
    if params[:name].nil?
      @tags = Tag.all.to_a.group_by{ |tag| tag.quotes.count}
    else
      @tag = Tag.find_by(name: params[:name])
      @quote = @tag.quotes.reverse_order
      @tags = Tag.all.to_a.group_by{ |tag| tag.quotes.count}
    end
   end

   def search
    @quotes = Quote.search(params[:keyword]).order("created_at DESC")
   end

  private
  def quote_params
    params.require(:quote).permit(:title, :citation, :explanation, :tag_ids).merge(user_id: current_user.id)
  end

end