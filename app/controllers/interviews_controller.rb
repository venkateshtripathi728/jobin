class InterviewsController < ApplicationController

  def create
    @interview = Interview.new(interview_params)
    @interview.application.user = current_user
    if @interview.save
      redirect_to application_path(@interview.application)
    end
    else
      render :applications/show
    end
    authorize @interview
  end
  
  def update
    if @interview.update(interview_params)
      redirect_to application_path(@interview.application)
    else
      render :new
    end
    authorize @interview
  end

  def destroy
    @interview.destroy
    redirect_to application_path(@interview.application)
    authorize @interview
  end

  private 

  def interview_params

    params.require(:interview).permit(:start_date,:end_date,:step,:notes)

  end
end
