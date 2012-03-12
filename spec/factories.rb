FactoryGirl.define do
  factory :shout do #interprets the Shout class from the symbol 
    # body "some text" # No longer has a body
    user # Knows to look through associations, see if it exists, then set it up"
  end

  factory :text_shout do
    body "some text"
    shout
  end
end
