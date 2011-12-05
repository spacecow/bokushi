class ApplicationController < ActionController::Base
  include BasicApplicationController
  protect_from_forgery
  #def created(s); t("successes.created",:o=>t(s)) end
end
