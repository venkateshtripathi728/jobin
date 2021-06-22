class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:update, :destroy]
      
    def create
      @organization = Organization.new(organizations_params)
      @experience.save
      redirect_to profile_path
      authorize @experience
    end
    
    def update
      @organization.update(organizations_params)
      redirect_to profile_path
      authorize @organization
    end
      
    def destroy
      @organization.destroy
      redirect_to profile_path
      authorize @organization
    end
      
    private
  
    def set_organization
      @organization = Organization.find(params[:id])
    end
      
    def tools_params
      params.require(:organization).permit(:name, :description, :category)
    end
end
