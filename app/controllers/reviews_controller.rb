class ReviewsController < ApplicationController

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
  
  def review_params

    params.require(:review).permit(:comment,:rating)

  end
  
end
