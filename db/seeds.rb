User.destroy_all
puts 'All Users destroyed!'

30.times do |index|
  u = User.new
  u.username = "User #{index}"
  u.email    = "test#{index}@test.com"
  u.save!

  puts 'User saved!'
end