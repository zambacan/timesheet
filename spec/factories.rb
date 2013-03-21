FactoryGirl.define do
  factory :user do
    first_name     "Raife"
    last_name "Stokes"
    email    "raife@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :client do
     name     "Allstate Home Loans"
     address "124 Main Street"
     city    "Spring Hill"
     postcode "4004"
     state  "QLD"
     phone  "0712345678"
     default_billing_rate "120"
     default_billing_unit "hour"     
   end
end