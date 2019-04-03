class ReviewsController < ApplicationController

  before_action :find_restaurant_id, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(reviews_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if  @review.save
      redirect_to restaurant_path(@restaurant)

    else
      render :new
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end

  def find_restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
