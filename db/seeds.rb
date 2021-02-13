puts "Cleaning database..."
Suit.destroy_all

puts "Creating Suits..."
10.times do 
  user = User.create(
      email: Faker::Internet.email,
      password: "hello12345"
  )
  puts "Created #{user.email}"
end
100.times do
  suit = Suit.create(
    user_id: User.all.sample.id,
    name: Faker::Superhero.name, 
    size: rand(32..50),
    colour: Faker::Color.color_name, 
    style: ["Formal", "Posh", "Hipster", "Informal"].sample,
    occasion:["interview", "funeral", "wedding", "party", "date"].sample,
    price: Faker::Commerce.price(range: 50..100.0, as_string: true),
    brand:["Hugo Boss", "Armani", "Zara", "H&M", ].sample,
    )

puts "Created suit #{suit.id} has been created"
end
puts "Finished!"