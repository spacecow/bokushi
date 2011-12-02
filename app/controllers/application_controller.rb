class ApplicationController < ActionController::Base
  protect_from_forgery

  def created(s); t("successes.created",:o=>t(s)) end
end
