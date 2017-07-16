require 'random_data'

#create users
50.times do
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(7)
        )
end

users = User.all

#create wikis

20.times do
    Wiki.create!(
        title: Faker::GameOfThrones.unique.character,
        body: RandomData.random_paragraph,
        private: false,
        user: users.sample
        )
end

20.times do
    Wiki.create!(
        title: Faker::GameOfThrones.unique.house,
        body: RandomData.random_paragraph,
        private: false,
        user: users.sample
        )
end

wikis = Wiki.all

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"