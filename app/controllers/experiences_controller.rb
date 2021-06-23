class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:update, :destroy]

  def create
    @experience = Experience.new(experiences_params)
    @experience.user = current_user
    @organization = Organization.find(params[:id])
    @experience.organization = @organizations
    @experience.save
    redirect_to profile_path
    authorize @experience
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

  def set_exprerience
    @experience = Experience.find(params[:id])
  end

  def tools_params
    params.require(:experience).permit(:start_date, :end_date, :description, :category)
  end
end
