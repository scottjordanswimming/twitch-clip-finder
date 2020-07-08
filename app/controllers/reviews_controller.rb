class ReviewsController < ApplicationController
#  http_basic_authenticate_with name: "brad", password:"1234", only: [:destroy]

before_action :redirect_if_not_logged_in
skip_before_action :redirect_if_not_logged_in, only: [:index]

  def create
@clip = Clip.find(params[:clip_id])
@review = @clip.reviews.create(review_params)
redirect_to clip_path(@clip)
  end

  def destroy
@clip = Clip.find(params[:clip_id])
@review = @clip.reviews.find(params[:id])
@review.destroy
redirect_to clip_path(@clip)
  end

  def index
    if @clip = Clip.find_by_id(params[:clip_id])
          @reviews = @clip.reviews
        else
          @reviews = Review.all
        end
      end

  private def review_params
params.require(:review).permit(:username, :body)
end
end
