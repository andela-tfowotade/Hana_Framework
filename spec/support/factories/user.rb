FactoryGirl.define do
  factory :user, class: User do
    name "name"
    age 1

    to_create(&:save)
  end
end
