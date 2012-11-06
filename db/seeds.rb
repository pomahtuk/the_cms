User.destroy_all
Page.destroy_all

puts 'All Users and Pages destroyed!'

6.times do |index|
  puts 'Create new User'

  u = User.new
  u.username = Faker::Name.name
  u.email    = Faker::Internet.free_email
  u.save!

  puts '=>Creating new books'

  3.times do |i|
    puts '-> new book'
    book = u.pages.new
    book.title           = "Book: #{Faker::Lorem.paragraph 1}"
    book.raw_content     = "From: author: #{Faker::Lorem.paragraph 6}"
    book.raw_description = "From: #{Faker::Lorem.paragraph 3}"
    book.save!

    10.times do
      puts '--> new chapter'

      chapter = u.pages.new
      chapter.title           = "Chapter: #{Faker::Lorem.paragraph 1}"
      chapter.raw_content     = "Chapter content: #{Faker::Lorem.paragraph 6}"
      chapter.raw_description = "Chapter description: #{Faker::Lorem.paragraph 3}"
      chapter.save!
      chapter.move_to_child_of book

      5.times do
        puts '---> new page'

        page = u.pages.new
        page.title           = Faker::Lorem.paragraph 1
        page.raw_content     = Faker::Lorem.paragraph 6
        page.raw_description = Faker::Lorem.paragraph 3
        page.save!
        page.move_to_child_of chapter
      end
    end

  end

  puts '=>Books created'

  puts 'new User created'
end