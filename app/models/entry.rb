class Entry < ActiveRecord::Base
  belongs_to :timetable
  before_save :convert_time

  def arrival_time
    arrival.strftime("%H:%M")
  end
  def departure_time
    departure.strftime("%H:%M")
  end

  private

    def convert_time
      p self.arrival
    end
end
