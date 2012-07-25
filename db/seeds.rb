User.destroy_all
puts 'All Users destroyed!'

30.times do |index|
  u = User.new
  u.username = Faker::Name.name
  u.email    = Faker::Internet.free_email
  u.save!

  puts 'User saved!'
end