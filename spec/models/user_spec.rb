require 'spec_helper'
describe User do
  it "can #create_shout" do
    text_shout = build(:text_shout) # Build a factory object.
    user = create(:user)
    shout = user.create_shout(text_shout)

    shout.medium.body.should == text_shout.body # Check the body is the correct body
    shout.user.should == user # Check the user is set
    shout.persisted?.should == true # Check the shout is saved
  end

  it "can #follow other users" do
    follower = create(:user)
    followed_user = create(:user)
    follower.follow(followed_user)
    follower.followed_users.should == [followed_user]
  end

  it "knows if it #can_follow a user" do
    follower = create(:user)
    followed_user = create(:user)
    unfollowed_user = create(:user)

    follower.follow(followed_user)

    follower.can_follow?(follower).should == false
    follower.can_follow?(followed_user).should == false
    follower.can_follow?(unfollowed_user).should == true
  end

  #### USING FAKE OBJECTS AND STUB.
  #### We need to stub out every single method with this model of testing
    # # Create two dummy, empty, mock objects
    # medium = stub("medium")
    # shout = stub("shout", save: "expected")
    # # Another arbitrary stub by the name of MockMedium.
    # # Has a method called "new" that returns "medium" (our stub)
    # mock_medium = stub("mock_medium", new: medium)

    # # Stub a method on a existing class.
    # # Instead of making a new class, it overrides the new method of
    # # the Shout class and has it return the "shout" stub (which on save returns "expected"
    # Shout.stubs(new: shout)

    # user = create(:user)
    # params = "foo"

    # user.create_shout(mock_medium, params).should == "expected"
    # mock_medium.should have_received(:new).with(params)
    # Shout.should have_received(:new).with(user_id: user.id, medium: medium)

    # #Spies let us see what is called on a method.
end
