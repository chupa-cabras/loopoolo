FactoryGirl.define do
  factory :comment do
    encounter nil
    user nil
    visible false
    content "MyText"
  end
end
