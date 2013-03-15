FactoryGirl.define do
  factory :user do
    first_name     "Raife"
    last_name "Stokes"
    email    "raife@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end