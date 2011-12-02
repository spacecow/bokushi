def fill_in_entry(h={})
  fill_in "Departure", :with => h[:dep] if h[:dep] 
  fill_in "Arrival", :with => h[:arr] if h[:arr] 
  click_button "Create Entry"
end
