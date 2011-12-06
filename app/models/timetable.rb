class Timetable < ActiveRecord::Base
  has_many :entries

  validates_presence_of :base,:destination

  CITIES = %w(Sendai Fukushima Yamagata)

  def route; "#{base} - #{destination}" end
end
