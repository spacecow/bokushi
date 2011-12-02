require 'spec_helper'

describe EntriesController do
  controller_actions = controller_actions("entries")

  before(:each) do
    @parent = Factory(:timetable)
    @model = Factory(:entry)
  end

  describe "a user is not logged in" do
    controller_actions.each do |action,req|
      if %(new).include?(action)
        it "should reach the #{action} page" do
          send("#{req}", "#{action}", :timetable_id => @parent.id, :id => @model.id)
          response.redirect_url.should be_nil
        end
      end
    end
  end
end
