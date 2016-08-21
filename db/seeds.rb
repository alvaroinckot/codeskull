user = User.create({
	email: "admin@admin.com",
	password: "12345678",
	password_confirmation: "12345678",
	fullname: "Administrator of CodeSkull II"
})


track = Track.new({
	title: 'Curso básico de Ruby on Rails',
	description: "The path of the righteous man is beset on 
	all sides by the iniquities of the selfish and the tyranny 
	of evil men. Blessed is he who, in the name of charity and 
	good will, shepherds the weak through the valley of darkness, 
	for he is truly his brother's keeper and the finder of lost 
	children. And I will strike down upon thee with great 
	vengeance and furious anger those who would attempt to poison 
	and destroy My brothers. And you will know My name is the 
	Lord when I lay My vengeance upon thee."
})


track.save!

track.users << user

track.save!


puts "Total users: #{User.all.count}"
puts "Total tracks: #{Track.all.count}"