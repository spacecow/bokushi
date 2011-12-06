require 'spec_helper'

describe "Timetables" do
  describe "show" do
    before(:each) do
      @timetable = Factory(:timetable)
      @timetable.entries << Factory(:entry,:departure=>"11:00",:arrival=>"11:40")
      @timetable.entries << Factory(:entry,:departure=>"10:00",:arrival=>"10:40")
      visit timetable_path(@timetable)
    end

    context "order on" do
      it "departure (default)" do
        table(0,0).should eq "10:00" 
        table(1,0).should eq "11:00" 
      end

      it "departure x 1 (descending)" do
        click_link "Departure"
        table(0,0).should eq "11:00" 
        table(1,0).should eq "10:00" 
      end

      it "arrival x 1 (ascending)" do
        click_link "Arrival"
        table(0,1).should eq "10:40" 
        table(1,1).should eq "11:40" 
      end

      it "arrival x 2 (descending)" do
        click_link "Arrival"
        click_link "Arrival"
        table(0,1).should eq "11:40" 
        table(1,1).should eq "10:40" 
      end
    end

    context "view" do
      it "details of a certain timetable" do
        page.should have_title("Sendai - Fukushima") 
      end

      it "list entries" do
        table(0).should eq %w(10:00 10:40)
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
