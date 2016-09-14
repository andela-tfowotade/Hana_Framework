FactoryGirl.define do
  factory :user, class: User do
    name "name"
    age 1

    to_create { |instance| instance.save }
  end
end
