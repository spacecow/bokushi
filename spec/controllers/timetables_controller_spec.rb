require 'spec_helper'

describe TimetablesController do
  controller_actions = controller_actions("timetables")

  before(:each) do
    @model = Factory(:timetable)
  end

  describe "a user is not logged in" do
    controller_actions.each do |action,req|
      if %w(show index new create).include?(action)
        it "should reach the #{action} page" do
          send(req,action,:id=>@model.id)
          response.redirect_url.should_not eq(login_url)
        end
      else
        it "should not reach the #{action} page" do
          send(req,action,:id=>@model.id)
          response.redirect_url.should_not be_nil
        end 
      end
    end
  end
end
