user = User.new({
	email: "alvaroinckot@gmail.com",
	password: "12345678",
	password_confirmation: "12345678",
	fullname: "Alvaro"
})

user.save!

puts "Total users: #{User.all.count}"