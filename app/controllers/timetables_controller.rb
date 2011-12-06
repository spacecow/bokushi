class TimetablesController < ApplicationController
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def show
    @entries = @timetable.entries.order(sort_column+" "+sort_direction)
    @entries = @entries.where(:vehicle => params[:vehicle]) if params[:vehicle]
    #@entries.select!{|e| e.vehicle == params[:vehicle]} if params[:vehicle]
    respond_to do |f|
      f.html
      f.json {render :json => @glossary.to_json}
    end
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

  private

    def sort_column
      Entry.column_names.include?(params[:sort]) ?  params[:sort] : 'departure'
    end
    def sort_direction
      %w(asc desc).include?(params[:direction]) ?  params[:direction] : 'asc'
    end
end
