Factory.define :entry do |f|
  f.departure "11:00"
  f.arrival "11:40"
end

Factory.define :timetable do |f|
  f.base "Sendai"
  f.destination "Fukushima"
end
