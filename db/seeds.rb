User.destroy_all
Page.destroy_all

puts 'All Users and Pages destroyed!'

20.times do |index|
  u = User.new
  u.username = Faker::Name.name
  u.email    = Faker::Internet.free_email
  u.save!

  15.times do |i|
    p = u.pages.new
    p.title       = Faker::Lorem.paragraph 1
    p.raw_content = Faker::Lorem.paragraph 6
    p.save!

    puts '-->Page saved!'
  end
  puts "Pages for User #{u.id} created"
  puts 'User saved!'
end