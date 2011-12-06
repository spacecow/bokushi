def fill_in_entry(h={})
  fill_in "Departure", :with => h[:dep] if h[:dep] 
  fill_in "Arrival", :with => h[:arr] if h[:arr] 
  select "MAX", :from => "Vehicle"
end

def create_entry(dep,arr,veh="max")
  Factory(:entry,:departure=>dep,:arrival=>arr,:vehicle=>veh)
end
