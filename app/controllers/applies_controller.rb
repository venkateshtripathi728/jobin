class AppliesController < ApplicationController
   before_action :set_apply, only: [:show,:edit,:update,:destroy]

  def index
    @applies = policy_scope(Apply).order(created_at: :desc)
    @apply = Apply.new
  end

  def show
    authorize @apply
    @interview = Interview.new
    @contact = Contact.new
    @review = Review.new
    @reviews = Review.all.order("votes DESC")
  end

  def create
    @apply = Apply.new(apply_params)
    authorize @apply
    @organization = Organization.find_by(name: params[:apply][:organization])
    @apply.organization = @organization
    @apply.user = current_user
    if @apply.save
      redirect_to apply_path(@apply)
    else
      redirect_to applies_path
    end
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

  def change_status
    @apply = Apply.find(params[:id])
    a = ["Ready to apply", "Applied", "Ongoing process", "Waiting for answer"]
    if a.index(@apply.status) == 0
      @apply.status = a[1]
    elsif a.index(@apply.status) == 1
      @apply.status = a[2]
    elsif a.index(@apply.status) == 2
      @apply.status = a[3]
    else
      @apply.status = a[2]
    end
    @apply.updatedate = Date.today()
    @apply.save
    redirect_to applies_path, notice: "status changed"
    authorize @apply
  end

  def accept
    @apply = Apply.find(params[:id])
    @apply.finalstatus = "Accepted"
    @apply.save
    redirect_to applies_path, notice: "Well done ! 🚀"
    authorize @apply
  end

  def decline
    @apply = Apply.find(params[:id])
    @apply.finalstatus = "Declined"
    @apply.save
    redirect_to applies_path, notice: "Keep doing ! 💪"
    authorize @apply
  end

  def change_read_apply
      @notification_apply = NotificationApply.find(params[:notification_apply_id])
      @notification_apply.read = true
      redirect_to apply_path(@notification_apply.apply)
      authorize @notification_apply
      @notification_apply.save!
  end

  def change_read_interview

      @notification_interview = NotificationInterview.find(params[:notification_interview_id])
      @notification_interview.read = true
      redirect_to apply_path(@notification_interview.interview.apply)
      authorize @notification_interview
      @notification_interview.save!
  end

  def upvote

  end


  private

  def set_apply
    @apply = Apply.find(params[:id])
  end

  def apply_params
    params.require(:apply).permit(:job_title, :description, :status, :progression_bar, :location, :ranking, :url, :organization_id, :finalstatus)
  end

end
