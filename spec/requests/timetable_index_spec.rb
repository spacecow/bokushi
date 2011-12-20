require 'spec_helper'

describe "Timetables" do
  describe "index" do
    before(:each) do
      @timetable = Factory(:timetable)
      visit timetables_path
    end

    context "view" do
      it "list title" do
        page.should have_title("Timetables")
      end 

      it "list timetables" do
        tablemap("",0).should == ["Sendai - Fukushima"]
      end
    end

    context "links to" do
      it "new timetable" do
        click_link "New Timetable" 
        page.current_path.should eq new_timetable_path
      end

      it "a certain timetable" do
        click_link "Sendai - Fukushima"
        page.current_path.should eq timetable_path(@timetable)  
      end
    end
  end
end
