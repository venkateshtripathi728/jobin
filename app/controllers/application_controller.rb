class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :check_notifications
    before_action :configure_permitted_parameters, if: :devise_controller?

    include Pundit
    # Pundit white-list approach
    after_action :verify_authorized, except: [:index], unless: :skip_pundit?
    after_action :verify_policy_scoped, only: [:index], unless: :skip_pundit?


    def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:linkedin_url, :photo])

      # For additional in app/views/devise/registrations/edit.html.erb
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:linkedin_url, :photo])
    end

  def home
  end

  def check_notifications
    if user_signed_in?
      @applies = current_user.applies
      @applies.each do |apply|
        if apply.finalstatus == "Pending"
          if apply.notification_applies.count == 0
            if apply.status == "Ready to apply" || apply.status == "Waiting for answer"
              if (Date.today() - apply.updatedate).ceil > 5
                NotificationApply.create!(apply: apply)
              end
            end
          end
          @notification_applies = NotificationApply.all
        end
      end
      int = []
      @applies.each do |apply|
        apply.interviews.each do |interview|
          int << interview.id
        end
      end
      @interviews = Interview.where(id:int)
      @interviews.each do |interview|
        if interview.apply.finalstatus == "Pending"
          if interview.notification_interviews.count == 0
            if interview.apply.status == "Applied" || interview.apply.status == "Ongoing procees"
              if (interview.date - Date.today()).ceil <= 3
                NotificationInterview.create!(interview: interview)
              end
            end
          end
          @notification_interviews = NotificationInterview.all
        end
      end
    end
  end

  def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
