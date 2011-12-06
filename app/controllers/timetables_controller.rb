class TimetablesController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def index
  end

  def new
  end

  def create
    if @timetable.save
      redirect_to timetables_path, :notice => created(:timetable)
    else
      render :new
    end
  end
end
