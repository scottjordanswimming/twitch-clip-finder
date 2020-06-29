class ReviewsController < ApplicationController
  http_basic_authenticate_with name: "brad", password:"1234", only: [:destroy]
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

  private def review_params
params.require(:review).permit(:username, :body)
end
end
