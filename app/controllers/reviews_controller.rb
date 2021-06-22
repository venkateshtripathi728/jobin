class ReviewsController < ApplicationController
  before_action :set_review, only[:destroy,:edit,:update]

  def create
    @review = Review.new(review_params)
    @review.interview.application.user = current_user
    if @review.save
      redirect_to application_path(@review.interview.application)
    else
      render :applications/show
    end
    authorize @review
  end
    
  def edit
    authorize @review
  end
  
  def update
    if @review.update(review_params)
      redirect_to application_path(@review.interview.application)
    else
      render :new
    end
    authorize @review
  end
  
  def destroy
    @review.destroy
    redirect_to application_path(@review.interview.application)
    authorize @review
  end
  
  private

  def set_review
    @review = Review.find(params[:id])
  end
  
  def review_params

    params.require(:review).permit(:comment,:rating)

  end
  
end
