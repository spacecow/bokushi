class ApplicationController < ActionController::Base
  include BasicApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to welcome_url, :alert => exception.message
    else
      redirect_to login_url, :alert => exception.message
    end
  end
  protect_from_forgery
  #def created(s); t("successes.created",:o=>t(s)) end
end
