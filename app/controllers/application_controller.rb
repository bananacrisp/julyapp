class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    case current_user.roles.first.name
      when 'admin'
        users_path
      when 'weekly'
        content_weekly_path
      when 'fortnightly'
        content_fortnightly_path
      when 'fortnightly_switch'
        content_fortnightly_switch_path
      when 'monthly'
        content_monthly_path
      when 'monthly_switch'
        content_monthly_switch_path
      else
        root_path
    end
  end

end