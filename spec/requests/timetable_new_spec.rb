require 'spec_helper'

describe "Timetables" do
  describe "new" do
    context "create a new timetable" do
      before(:each) do
        visit new_timetable_path
      end

      it "adds a new timetable" do
        click_button "Create Timetable" 
      end
    end
  end
end
