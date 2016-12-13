
Operator.create(user_name: "operator", password: "123456") if Operator.where(user_name: "operator").blank?
User.create(email: "user@gmail.com", user_name: "user", password: "123456") if User.where(email: "user@gmail.com").blank?
(1..10).each do
  Shop.create(name: Faker::Company.name, address: Faker::Address.street_address, phone: Faker::PhoneNumber.phone_number, deposit: Faker::Number.decimal(2), lat: Faker::Address.latitude, long: Faker::Address.longitude)
end
