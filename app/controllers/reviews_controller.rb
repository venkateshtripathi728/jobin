class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy,:edit,:update]

  def create
    @experience = Experience.new(experiences_params)
    authorize @experience
    @experience.user = @apply
    if @experience.save
      redirect_to apply_path(@apply)
    else
      @display_modal = true
      render apply_path(@apply)
    end
  end


  def edit
    authorize @review
  end

  def update
    if @review.update(review_params)
      redirect_to apply_path(@review.interview.apply)
    else
      render :new
    end
    authorize @review
  end

  def destroy
    @review.destroy
    redirect_to apply_path(@review.interview.apply)
    authorize @review
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def reviews_params

    params.require(:review).permit(:comment,:rating)

  end

end
