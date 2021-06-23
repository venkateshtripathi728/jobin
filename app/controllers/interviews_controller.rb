class InterviewsController < ApplicationController
  before_action :set_interview, only: [:destroy, :edit, :update]


  def create
    @interview = Interview.new(interview_params)
    @interview.apply = @apply
    if @interview.save
      redirect_to apply_path(@interview.apply)
    else
      render :applies/show
    end
    authorize @interview
  end

  def edit
    authorize @interview
  end

  def update
    if @interview.update(interview_params)
      redirect_to apply_path(@interview.apply)
    else
      render :new
    end
    authorize @interview
  end

  def destroy
    @interview.destroy
    redirect_to apply_path(@interview.apply)
    authorize @interview
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:start_date,:end_date,:step,:notes)
  end
end
