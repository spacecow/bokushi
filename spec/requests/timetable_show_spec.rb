require 'spec_helper'

describe "Timetables" do
  describe "show" do
    before(:each) do
      @timetable = Factory(:timetable)
    end
      
    context "order on" do
      before(:each) do
        @timetable.entries << create_entry("11:00","11:40") 
        @timetable.entries << create_entry("10:00","10:40") 
        visit timetable_path(@timetable)
      end

      it "departure (default)" do
        table("",0,0).should eq "10:00" 
        table("",1,0).should eq "11:00" 
      end

      it "departure x 1 (descending)" do
        click_link "Departure"
        table("",0,0).should eq "11:00" 
        table("",1,0).should eq "10:00" 
      end

      it "arrival x 1 (ascending)" do
        click_link "Arrival"
        table("",0,1).should eq "10:40" 
        table("",1,1).should eq "11:40" 
      end

      it "arrival x 2 (descending)" do
        click_link "Arrival"
        click_link "Arrival"
        table("",0,1).should eq "11:40" 
        table("",1,1).should eq "10:40" 
      end
    end

    context "view" do
      it "details of a certain timetable" do
        visit timetable_path(@timetable)
        page.should have_title("Sendai - Fukushima") 
      end

      context "list certain tables" do
        before(:each) do
          @timetable.entries << create_entry("10:00","10:40","bus") 
          @timetable.entries << create_entry("11:00","12:40","max") 
        end

        it "on the same page" do
          visit timetable_path(@timetable)
          table(:bus,0).should eq %w(10:00 10:40)
          table(:max,0).should eq %w(11:00 12:40)
        end

        it "individual" do
          visit timetable_path(@timetable,:vehicle=>"bus")
          page.should have_a_table(:bus)
          page.should_not have_a_table(:max)
        end
      end
    end

    context "links to" do
      it "new entry" do
        visit timetable_path(@timetable)
        click_link "New Entry"
        page.current_path.should eq new_timetable_entry_path(@timetable)
      end
    end
  end
end
