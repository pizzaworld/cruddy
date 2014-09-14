FactoryGirl.define do
  factory :invalid_horse, class: Horse do
  end

  factory :horse do
    name 'Mr. Ed'
  end
end
