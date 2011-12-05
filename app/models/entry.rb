class Entry < ActiveRecord::Base
  belongs_to :timetable

  def arrival_time
    arrival.strftime("%H:%M")
  end
  def departure_time
    departure.strftime("%H:%M")
  end

  private

    def arrival=(s)
      if data = s.match(/^(\d+)(\d\d)$/) 
        s = "#{data[1]}:#{data[2]}"
      end
      self[:arrival] = s
    end
    def departure=(s)
      if data = s.match(/^(\d+)(\d\d)$/) 
        s = "#{data[1]}:#{data[2]}"
      end
      self[:departure] = s
    end
end
