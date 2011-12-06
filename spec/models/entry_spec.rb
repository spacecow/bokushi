require 'spec_helper'

describe Entry do
  context "#vehicle(s)" do
    it "gets the humanized version of the vehicle" do
      Entry::vehicle("bus").should eq "Bus"
    end
  end
end
