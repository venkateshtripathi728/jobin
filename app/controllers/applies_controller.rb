class AppliesController < ApplicationController
   before_action :set_apply, only: [:show,:edit,:update,:destroy]

  def index
    @applies = policy_scope(Apply).order(created_at: :desc)
    @apply = Apply.new
  end

  def show
    authorize @apply
    @interview = Interview.new
    # authorize @interview
    @contact = Contact.new
    # authorize @contact
  end

  def create
    @apply = Apply.new(apply_params)
    @apply.user = current_user
    if @apply.save
      redirect_to applies_path
    else
      render "applies/index"
    end
    authorize @apply
  end
  def edit
    authorize @apply
  end

  def update
    @apply.update(apply_params)
    redirect_to applies_path
    authorize @apply
  end
  def destroy
    @apply.destroy
    redirect_to applies_path
    authorize @apply
  end

  private

  def set_apply
    @apply = Apply.find(params[:id])
  end

  def apply_params
    params.require(:apply).permit(:job_title, :description, :status, :progression_bar, :location, :ranking, :url)
  end

end
