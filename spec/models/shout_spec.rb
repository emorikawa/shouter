require 'spec_helper'

describe Shout do
  # Put method name (.current) in the description.
  # The . signifies it's a class method
  it "returns .current shouts in reverse chronological order" do
    older_shout = create(:shout) # create method comes from factory_girl
    newer_shout = create(:shout)
    Shout.current.should == [newer_shout, older_shout]
  end

  it "returns matches to .search queries" do
    ## EVAN'S TEST
    # matching_text_shout = create(:text_shout)
    # matching_photo_shout = create(:photo_shout)

    # matching_query = "FooBar"
    # non_matching_query = "no match"

    # Shout.search(matching_query).should == [matching_text_shout, matching_photo_shout]
    # Shout.search(non_matching_query).should == []


    # MATT's TEST
    matched_shouts = [
      create(:text_shout, body: "Wombat").shout,
      create(:text_shout, body: "Wally Wombat").shout,
    ]
    unmatched_shout = create(:text_shout, body: "Walrus").shout
    Shout.search("wombat").should =~ matched_shouts

  end
end
