
Operator.create(user_name: "operator", password: "123456", admin: true) if Operator.where(user_name: "operator").blank?
User.create(email: "user@gmail.com", user_name: "user", password: "123456") if User.where(email: "user@gmail.com").blank?
Setting.create(key: "rate_percent", value: "10")
Setting.create(key: "amount_percent", value: "6:4")
(1..50).each do
  Shop.create(name: Faker::Company.name, address: Faker::Address.street_address, phone: Faker::PhoneNumber.phone_number, deposit: Faker::Number.decimal(2), lat: Faker::Address.latitude, long: Faker::Address.longitude, operator_id: Operator.first.id)
end

(1..50).each do
	User.create(email: Faker::Internet.email, password: "123456", user_name: Faker::Internet.user_name, )
end	

(1..50).each do
	Operator.create(admin: true, password: "123456", user_name: Faker::Internet.user_name, )
end	

(1..100).each do
  BtcAddress.create(address: Faker::Bitcoin.address, user_id: Faker::Number.between(1, 50), shop_id: Faker::Number.between(1, 50))
end

(1..200).each do
  Reservation.create(amout: Faker::Number.decimal(7, 0), rate: 64948, btc_jpy: false, status: 0, user_id: Faker::Number.between(1, 50), shop_id: Faker::Number.between(1, 50), btc_address_id: Faker::Number.between(1, 100))
end

(1..200).each do
  Reservation.create(amout: Faker::Number.decimal(2, 0), rate: 2, btc_jpy: true, status: 0, user_id: Faker::Number.between(1, 50), shop_id: Faker::Number.between(1, 50), btc_address_id: Faker::Number.between(1, 100))
end
