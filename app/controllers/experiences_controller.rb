class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:update, :destroy]

  def create
    @experience = Experience.new(experiences_params)
    authorize @experience
    @experience.user = current_user
    if @experience.save
      redirect_to profile_path
    else
      if @experience.category == "school"
      @display_modal_school = true
      render "pages/profile"
      else
      @display_modal_exp = true
      render "pages/profile"
      end
    end


  end

  def update
    @experience.update(experiences_params)
    redirect_to profile_path
    authorize @experience
  end

  def destroy
    @experience.destroy
    redirect_to profile_path
    authorize @experience
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experiences_params
    params.require(:experience).permit(:start_date, :end_date, :description, :category,:location, :organization_id)
  end
end
