class EntriesController < ApplicationController
  before_filter :load_timetable, :only => [:new,:create,:edit,:update]

  def new
    @entry = @timetable.entries.build
  end

  def create
    @entry = @timetable.entries.build(params[:entry])
    if @entry.save
      redirect_to @timetable, :notice => created(:entry)
    else
      render :new
    end
  end

  def edit
    @entry = @timetable.entries.find(params[:id])
  end

  private

    def load_timetable
      @timetable = Timetable.find(params[:timetable_id])
    end
end
