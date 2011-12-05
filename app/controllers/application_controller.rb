class ApplicationController < ActionController::Base
  protect_from_forgery

  def created(s); t("successes.created",:o=>t(s)) end

  def current_user
    @current_user ||= User.find(session[:userid]) if session[:userid]
  end
end
