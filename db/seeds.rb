# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying user database"
User.destroy_all

puts "User database cleaned"
puts "Getting user data"
User.create!(email: "koki@chrysalis.com", password: "123123", first_name: "Koki", last_name: "Takahashi")
User.create!(email: "alison@chrysalis.com", password: "123123", first_name: "Alison", last_name: "Jeffrey")
User.create!(email: "sae@chrysalis.com", password: "123123", first_name: "Sae", last_name: "Matsuda")
User.create!(email: "alex@chrysalis.com", password: "123123", first_name: "Alex", last_name: "Komaha")

puts "#{User.count} users created"

User.all.each do |user|
  puts "Getting emotions data"
  (1..20).each do |num|
    Emotion.create!(
      emotion_level: rand(1..20),
      user: user,
      created_at: Date.today - num
    )
    puts "#{Emotion.count} user emotions created"
  end

  puts "Getting journal data"

  10.times do
    Journal.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraphs,
      user: user
    )
  end

  puts "#{Journal.count} journals created"

  puts "Getting goal data"
  UserGoal.create!(description: "Make my bed", user: user, status: "done")
  UserGoal.create!(description: "Take a shower or a bath", user: user, status: "done")
  UserGoal.create!(description: "Make myself lunch", user: user, status: "done")
  UserGoal.create!(description: "Talk to a family member or friend", user: user, status: "done")
  UserGoal.create!(description: "Brush my teeth", user: user, status: "done")
  UserGoal.create!(description: "Wash the dishes", user: user, status: "done")
  UserGoal.create!(description: "Take a short walk", user: user, status: "done")
  UserGoal.create!(description: "Clean my room", user: user, status: "done")
  UserGoal.create!(description: "Change clothes", user: user, status: "done")
  UserGoal.create!(description: "Call my grandma", status: "active", user: user)
  UserGoal.create!(description: "Watch TV with my mother", status: "inactive", user: user)
  UserGoal.create!(description: "Take the dog for a walk", status: "active", user: user)
  UserGoal.create!(description: "Organise my manga collection", status: "inactive", user: user)
  UserGoal.create!(description: "Make an appointment with my doctor", status: "active", user: user)
  UserGoal.create!(description: "Go to the drugstore and buy toilet paper", status: "inactive", user: user)
  UserGoal.create!(description: "Call my friend and see if he wants to come over", status: "active", user: user)
  UserGoal.create!(description: "Take out the trash", status: "active", user: user)
  UserGoal.create!(description: "Do my laundry", status: "done", user: user)

  puts "#{UserGoal.count} user goals created"
end
