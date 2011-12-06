require 'spec_helper'

describe "Timetables" do
  describe "show" do
    before(:each) do
      @timetable = Factory(:timetable)
      visit timetable_path(@timetable)
    end

    context "view" do
      it "details of a certain timetable" do
        page.should have_title("Sendai - Fukushima") 
      end
    end

    context "links to" do
      it "new entry" do
        click_link "New Entry"
        page.current_path.should eq new_timetable_entry_path(@timetable)
      end
    end
  end
end
