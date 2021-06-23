class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy,:edit,:update]

  def create
    @review = Review.new(review_params)
    @review.interview.apply.user = current_user
    if @review.save
      redirect_to apply_path(@review.interview.apply)
    else
      render :applies/show
    end
    authorize @review
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

  def review_params

    params.require(:review).permit(:comment,:rating)

  end

end
