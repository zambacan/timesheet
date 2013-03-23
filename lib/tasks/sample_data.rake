namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Client.create!(name: "IBM",
                 address: "123 Main St",
                 city: "Seatle",
                 state: "VIC",
                 postcode: "3024",
                 phone: "0711113333")
    99.times do |n|
      name  = Faker::Name.name
      address  = Faker::Address.street_address
      city  = Faker::Address.city
      state  = Faker::Address.us_state
      postcode  = Faker::Address.uk_postcode
      phone  = Faker::PhoneNumber.phone_number
      Client.create!(name: name,
                   address: address,
                   city: city,
                   state: state,
                   postcode: postcode,
                   phone: phone)
    end
  end
end