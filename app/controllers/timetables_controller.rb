class TimetablesController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
  end

  def create
    redirect_to root_path
  end
end
