class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :set_book

  def new
    @review = Review.new
  end

  def create
  @review = @book.reviews.new(review_params)
  @review.user = current_user
  if @review.save
    redirect_to @book, notice: "Review added!"
  else
    render :new, status: :unprocessable_entity
  end
end

  def destroy
  @review = @book.reviews.find(params[:id])
  if @review.user == current_user
    @review.destroy
    redirect_to @book, notice: "Review deleted."
  else
    redirect_to @book, alert: "You can only delete your own reviews."
  end
end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.expect(review: [:body, :rating])
  end
end