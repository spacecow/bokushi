require 'spec_helper'

describe "Entries" do
  describe "edit" do
    before(:each) do
      timetable = Factory(:timetable)
      entry = timetable.entries << Factory(:entry,:departure=>"11:00")
      visit edit_timetable_entry_path(timetable,entry)
    end

    context "view" do
      it "layout" do
        find_field("Departure").value.should eq "11:00" 
        find_field("Arrival").value.should eq "11:40" 
        selected_value("Vehicle").should eq "MAX" 
      end      
    end
  end
end
