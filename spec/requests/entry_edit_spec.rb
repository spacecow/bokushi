require 'spec_helper'

describe "Entries" do
  describe "edit" do
    before(:each) do
      timetable = Factory(:timetable)
      entry = timetable.entries << Factory(:entry,:departure=>"Sendai")
      visit edit_timetable_entry_path(timetable,entry)
    end

    context "view" do
      it "layout" do
        find_field("Departure").should have_content("Sendai")
      end      
    end
  end
end
