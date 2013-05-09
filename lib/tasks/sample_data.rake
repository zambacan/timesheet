namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Client.create!(name: "IBM",
    address: "123 Main St",
    city: "Seatle",
    state: "VIC",
    postcode: "3024",
    phone: "0711113333")
    20.times do |n|
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
clients=Client.all

          5.times do 
            #
           first_name   =Faker::Name.first_name  
           last_name   =Faker::Name.last_name  
           phone   =Faker::PhoneNumber.phone_number  
           email   =Faker::Internet.email  
           clients.each { |client | client.contacts.create!(first_name: first_name, last_name: last_name, phone: phone, email: email)}
           # invoice_contact :boolean          default(FALSE)
            project_name   =Faker::Name.first_name  
            project_description   =Faker::Name.last_name  
            clients.each { |client | client.projects.create!(project_description: project_description, project_name: project_name)}
            # invoice_contact :boolean          default(FALSE)

    end
   
     first_name   =Faker::Name.first_name  
     last_name   =Faker::Name.last_name  
     phone   =Faker::PhoneNumber.phone_number  
     email   =Faker::Internet.email  
     clients.each { |client | client.contacts.create!(first_name: first_name, last_name: last_name, phone: phone, email: email)}
     # invoice_contact :boolean          default(FALSE)
  end
end



# end

# clients=Client.all(limit: 5)

