FactoryGirl.define do
  factory :shout do #interprets the Shout class from the symbol 
    body "some text"
    user # Knows to look through associations, see if it exists, then set it up"
  end
end
