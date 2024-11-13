class ReviewsController < ApplicationController
  before_action :set_restaurant

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to @restaurant, notice: "Review was successfully created."
    else
      @reviews = @restaurant.reviews
      render "restaurants/show"
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
