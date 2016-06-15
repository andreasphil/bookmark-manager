FactoryGirl.define do
  factory :user do
    email 'rake_test@example.com'
    password "password"
    password_confirmation "password"
  end
end