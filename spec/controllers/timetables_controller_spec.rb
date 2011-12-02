require 'spec_helper'

describe TimetablesController do
  controller_actions = controller_actions("timetables")

  before(:each) do
    @model = Factory(:entry)
  end

  describe "a user is not logged in" do
    controller_actions.each do |action,req|
      if %w(show index).include?(action)
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :id => @model.id)
          response.redirect_url.should be_nil
        end
      end
    end
  end
end
