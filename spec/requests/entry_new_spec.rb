require 'spec_helper'

describe "Entries" do
  describe "new" do
    before(:each) do
      @timetable = Factory(:timetable)
      visit new_timetable_entry_path(@timetable)
    end

    context "view" do
      it "layout" do
        find_field("Departure").value.should be_nil
        find_field("Arrival").value.should be_nil
        options("Vehicle").should have_content("BLANK, Bus, MAX") 
        selected_value("Vehicle").should be_nil
      end
    end
    context "convert time" do
      it "one number means an hour" do
        fill_in_entry(:dep=>"2",:arr=>"3")
        click_button "Create Entry"
        Entry.last.departure_time.should eq "02:00"
        Entry.last.arrival_time.should eq "03:00"
      end

      it "two numbers means two hours" do
        fill_in_entry(:arr=>"11",:dep=>"19")
        click_button "Create Entry"
        Entry.last.arrival_time.should eq "11:00"
        Entry.last.departure_time.should eq "19:00"
      end
  
      it "three numbers means an hour and minutes" do
        fill_in_entry(:arr=>"112",:dep=>"345")
        click_button "Create Entry"
        Entry.last.arrival_time.should eq "01:12"
        Entry.last.departure_time.should eq "03:45"
      end

      it "four numbers means a 2-digt hour and minutes" do
        fill_in_entry(:arr=>"1123",:dep=>"1453")
        click_button "Create Entry"
        Entry.last.arrival_time.should eq "11:23"
        Entry.last.departure_time.should eq "14:53"
      end
    end

    context "create a new entry" do
      before(:each) do
        fill_in_entry(:dep=>"12:34",:arr=>"23:45")
      end

      it "adds a new entry" do
        lambda do
          click_button "Create Entry"
        end.should change(Entry,:count).by(1)
      end

      it "departure should be saved" do
        click_button "Create Entry"
        Entry.last.departure_time.should eq "12:34"
      end

      it "arrival should be saved" do
        click_button "Create Entry"
        Entry.last.arrival_time.should eq "23:45"
      end

      it "arrival should be calculated if not given" do
        fill_in "Arrival", :with => ""
        click_button "Create Entry"
        Entry.last.arrival_time.should eq "13:14"
      end

      it "vehicle should be saved" do
        click_button "Create Entry"
        Entry.last.vehicle.should eq "max"
      end

      it "flash should be seen" do
        click_button "Create Entry"
        page.should have_notice("Successfully created Entry.") 
      end

      it "should be redirected to the timetable" do
        click_button "Create Entry"
        page.current_path.should == timetable_path(@timetable)
      end

      it "should be owned by the timetable" do
        click_button "Create Entry"
        Entry.last.timetable_id.should be(@timetable.id)  
      end

      it "vehicle can't be emtpy" do
        select "", :from => "Vehicle"
        click_button "Create Entry"
        li(:vehicle).should have_blank_error
      end
    end
  end
end
