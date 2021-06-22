class VotesController < ApplicationController
  before_action :set_vote, only[:destroy,:edit,:update]

  def create
    @vote = Vote.new(vote_params)
    @vote.review.interview.application.user = current_user
    if @vote.save
      redirect_to application_path(@vote.review.interview.application)
    else
      render :applications/show
    end
    authorize @vote
  end

  def edit 
    authorize @vote
  end 

  def update
    if @vote.update(vote_params)
      redirect_to application_path(@vote.review.interview.application)
    else
      render :new
    end
    authorize @vote
  end
  
  def destroy
    @vote.destroy
    redirect_to application_path(@vote.review.interview.application)
    authorize @vote
  end
  
  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:up)
  end
end

