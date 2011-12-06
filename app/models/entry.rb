class Entry < ActiveRecord::Base
  belongs_to :timetable
  attr_accessible :departure, :arrival, :vehicle
  validates_presence_of :vehicle, :timetable

  VEHICLES = [["Bus","bus"],["MAX","max"]]

  def arrival_time
    arrival && arrival.strftime("%H:%M")
  end
  def departure_time
    departure && departure.strftime("%H:%M")
  end

  def arrival=(s)
    if s.empty? || s.nil?
      s = departure + 40.minutes 
    elsif data = s.match(/^(\d+)(\d\d)$/) 
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

  class << self
    def vehicle(s)
      VEHICLES.select{|a,b| b==s}.flatten.first
    end
  end
end
