class ExperiencesController < ApplicationController
    
      def create
        @experience = Experience.new(experiences_params)
        @experience.user = current_user
        if @experience.save
          redirect_to application_path(@tool)
        else
          render :new
        end
        authorize @experience
      end
    
      def edit
        authorize @experience
      end
    
      def update
        if @experience.update(experiences_params)
          redirect_to tool_path(@tool)
        else
          render :new
        end
        authorize @tool
      end
    
      def destroy
        @experience.destroy
        redirect_to 
        authorize @tool
      end
    
      private
    
      def set_tool
          @tool = Tool.find(params[:id])
      end
    
      def tools_params
        params.require(:tool).permit(:tool_name, :tool_description, :price, :longitude, :latitude, :address, :category, :photo)
      end
    
    end
end
