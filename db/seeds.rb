puts "Destroying user database"
User.destroy_all

puts "User database cleaned"
puts "Getting user data"
User.create!(email: "koki@chrysalis.com", password: "123123", first_name: "Koki", last_name: "Takahashi")
User.create!(email: "alison@chrysalis.com", password: "123123", first_name: "Alison", last_name: "Jeffrey")
User.create!(email: "sae@chrysalis.com", password: "123123", first_name: "Sae", last_name: "Matsuda")
User.create!(email: "alex@chrysalis.com", password: "123123", first_name: "Alex", last_name: "Komaha")
User.create!(email: "toshiro@chrysalis.com", password: "123123", first_name: "Toshiro", last_name: "Tanaka")
puts "#{User.count} users created"

User.all.each do |user|
  puts "Getting emotions data"
  (1..20).each do |num|
    Emotion.create!(
      emotion_level: rand(1..8),
      user: user,
      created_at: Date.today - num
    )
    puts "#{Emotion.count} user emotions created"
  end

  puts "Getting journal data"

  titles = ["I achieved my goals today!", "My talk with my doctor", "Today was a bad day", "Had a fight with my dad", "Might have been the worst day of my life", "Made lunch for the first time in a while", "Achieved 4 goals!!", "Kinda depressed", "Helped mom with some house chores", "Didn’t leave my room today", "Bad morning, good evening!", "Look back on my progress so far", "Almost left the house today", "Spoke with Nana-chan", "Today was a nothing day"]
  contents = ["I achieved all goals today", "I went to see a doctor", "not feeling well", "I thought I started off my day really well today. I added goals to help mom out around the house and so I helped her to fold some laundry. We watched TV together as we folded up the laundry and it was a really nice afternoon. It’s been great to socialise with her more lately. But dad has still been distant.

    I also wanted to work on running an errand out of the house. I thought I might go to the post office to send a package for my dad but I had that feeling in my chest again. As soon as I started to put on my shoes in the genkan, I started panicking and went back to my room. I didn’t come out for dinner so mom left my food outside my door again.

    When my dad got back from work he suddenly exploded when he saw the undelivered package… I tried to explain that it was too hard today. But, he didn’t want to listen. He shouted at me again about how ashamed he is of me.

    I’m going to try again tomorrow.", "All went wrong", "I made yakisoba which was really good", "Accomplished 4 goals", "I am kinda feeling depressed today", "Helped mom and feeling good", "I didn't leave my room", "I had a bad morning", "It’s been a while since I started using Chrysalis. I can see how I’ve improved but I still have a way to go yet.

    I can’t believe how far I’ve come though. I don’t know if I could have done this alone. When I think back to when I first signed up, I never left my room and my parents were barely speaking to me. Mom understands my feelings a bit more now. I think dad is also coming around and can see that I’m making progress.

    I want to be able to make them proud so I’m going to keep giving myself challenges and keep reaching goals.

    Who knows, maybe I’ll have a job by the end of the year! Let’s only hope.", "Almost left the house, but I couldnt go out", "I called my best friend", "I didn't nothing today"]

  titles.each_with_index do |title, index|
    Journal.create!(
      title: title,
      content: contents[index],
      user: user
    )
  end

  puts "#{Journal.count} journals created"

  puts "Getting goal data"

  30.times do
    UserGoal.create!(
      description: "Take a shower or a bath",
      user: user,
      status: "done"
    )
  end

  5.times do
    UserGoal.create!(
      description: "Take a shower or a bath",
      user: user,
      status: "inactive"
    )
  end

  24.times do
    UserGoal.create!(
      description: "Make my bed",
      user: user,
      status: "done"
    )
  end

  15.times do
    UserGoal.create!(
      description: "Take a shower or a bath",
      user: user,
      status: "inactive"
    )
  end

  15.times do
    UserGoal.create!(
      description: "Make myself lunch",
      user: user,
      status: "done"
    )
  end

  8.times do
    UserGoal.create!(
      description: "Make myself lunch",
      user: user,
      status: "inactive"
    )
  end

  18.times do
    UserGoal.create!(
      description: "Talk to a family member or friend",
      user: user,
      status: "done"
    )
  end

  8.times do
    UserGoal.create!(
      description: "Talk to a family member or friend",
      user: user,
      status: "inactive"
    )
  end

  46.times do
    UserGoal.create!(
      description: "Brush my teeth",
      user: user,
      status: "done"
    )
  end

  8.times do
    UserGoal.create!(
      description: "Brush my teeth",
      user: user,
      status: "inactive"
    )
  end

  20.times do
    UserGoal.create!(
      description: "Wash the dishes",
      user: user,
      status: "done"
    )
  end

  13.times do
    UserGoal.create!(
      description: "Wash the dishes",
      user: user,
      status: "inactive"
    )
  end

  5.times do
    UserGoal.create!(
      description: "Take a short walk",
      user: user,
      status: "done"
    )
  end

  6.times do
    UserGoal.create!(
      description: "Take a short walk",
      user: user,
      status: "inactive"
    )
  end

  3.times do
    UserGoal.create!(
      description: "Clean my room",
      user: user,
      status: "done"
    )
  end

  1.times do
    UserGoal.create!(
      description: "Clean my room",
      user: user,
      status: "inactive"
    )
  end

  5.times do
    UserGoal.create!(
      description: "Change clothes",
      user: user,
      status: "done"
    )
  end

  2.times do
    UserGoal.create!(
      description: "Change clothes",
      user: user,
      status: "inactive"
    )
  end

  1.times do
    UserGoal.create!(
      description: "Call my grandma",
      user: user,
      status: "inactive"
    )
  end

  4.times do
    UserGoal.create!(
      description: "Watch TV with my mother",
      user: user,
      status: "done"
    )
  end

  2.times do
    UserGoal.create!(
      description: "Take the dog for a walk",
      user: user,
      status: "inactive"
    )
  end

  1.times do
    UserGoal.create!(
      description: "Organise my manga collection",
      user: user,
      status: "inactive"
    )
  end

  2.times do
    UserGoal.create!(
      description: "Make an appointment with my doctor",
      user: user,
      status: "done"
    )
  end

  2.times do
    UserGoal.create!(
      description: "Go to doctor's appointment",
      user: user,
      status: "done"
    )
  end

  1.times do
    UserGoal.create!(
      description: "Go to the drugstore and buy toilet paper",
      user: user,
      status: "inactive"
    )
  end

  1.times do
    UserGoal.create!(
      description: "Call my friend and see if he wants to come over",
      user: user,
      status: "inactive"
    )
  end

  3.times do
    UserGoal.create!(
      description: "Take out the trash",
      user: user,
      status: "done"
    )
  end

  5.times do
    UserGoal.create!(
      description: "Do my laundry",
      user: user,
      status: "done"
    )
  end

  puts "#{UserGoal.count} user goals created"
end
