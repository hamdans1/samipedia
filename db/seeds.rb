require 'random_data'

#create wikis

50.times do
    Wiki.create!(
        title: RandomData.random_word,
        body: RandomData.random_paragraph,
        private: false
        )
end

wikis = Wiki.all

puts "Seed finished"
puts "#{Wiki.count} wikis created"