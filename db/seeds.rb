User.destroy_all
Page.destroy_all

puts 'All Users and Pages destroyed!'

30.times do |index|
  u = User.new
  u.username = Faker::Name.name
  u.email    = Faker::Internet.free_email
  u.save!

  puts 'User saved!'
end

puts '*' * 30

30.times do |index|
  p = Page.new
  p.title       = Faker::Lorem.paragraph 1
  p.raw_content = Faker::Lorem.paragraph 6
  p.save!

  puts 'Page saved!'
end


