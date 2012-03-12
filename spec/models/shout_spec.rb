require 'spec_helper'

describe Shout do
  # Put method name (.current) in the description.
  # The . signifies it's a class method
  it "returns .current shouts in reverse chronological order" do
    older_shout = create(:shout) # create method comes from factory_girl
    newer_shout = create(:shout)
    Shout.current.should == [newer_shout, older_shout]
  end
end
