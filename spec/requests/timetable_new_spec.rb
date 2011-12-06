require 'spec_helper'

describe "Timetables" do
  describe "new" do
    context "create a new timetable" do
      before(:each) do
        visit new_timetable_path
        select "Sendai", :from => "Base"
        select "Fukushima", :from => "Destination"
      end

      it "adds a timetable" do
        lambda do
          click_button "Create Timetable" 
        end.should change(Timetable,:count).by(1)
      end

      it "sets the base" do
        click_button "Create Timetable"
        Timetable.last.base.should eq "Sendai"
      end
    
      it "sets the destination" do
        click_button "Create Timetable"
        Timetable.last.destination.should eq "Fukushima"
      end

      it "should take the user to the timetable index page" do
        click_button "Create Timetable"
        page.current_path.should eq timetables_path
      end

      it "should show the user a flash message" do
        click_button "Create Timetable"
        page.should have_notice("Successfully created Timetable.")
      end

      it "base cannot be left empty" do
        select "", :from => I18n.t(:base) 
        lambda do
          click_button "Create Timetable"
        end.should change(Timetable,:count).by(0)
        error_field(:base).should have_content("can't be blank")
      end

      it "destination cannot be left empty" do
        select "", :from => I18n.t(:destination) 
        lambda do
          click_button "Create Timetable"
        end.should change(Timetable,:count).by(0)
        error_field(:destination).should have_content("can't be blank")
      end
    end
  end
end
