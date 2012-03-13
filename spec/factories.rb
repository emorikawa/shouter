FactoryGirl.define do
  factory :shout do #interprets the Shout class from the symbol 
    # body "some text" # No longer has a body
    user # Knows to look through associations, see if it exists, then set it up"
  end

  factory :text_shout do
    body "FooBar"
    shout
  end

  factory :photo_shout do
    photo_file_name "My FooBar File"
    photo_content_type "image/jpeg"
    photo_file_size 5000000
    shout
  end
end
