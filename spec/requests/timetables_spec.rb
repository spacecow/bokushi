require 'spec_helper'

describe "Timetables" do
  describe "show" do
    it "works! (now write some real specs)" do
      timetable = Factory(:timetable)
      visit timetable_path(timetable)
    end
  end
end
