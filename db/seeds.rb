# Creating seeds for users

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

# Creating seeds for emotions, journals and goals for users

User.all.each do |user|
  puts "Getting emotions data"
  (1..60).each do |num|
    Emotion.create!(
      emotion_level: rand(1..7),
      user: user,
      created_at: Date.today - num
    )
    puts "#{Emotion.count} user emotions created"
  end

  puts "Getting journal data"

  titles = ["I achieved my goals today!", "My talk with my doctor", "Today was a bad day", "Had a fight with my dad", "Might have been the worst day of my life", "Made lunch for the first time in a while", "Achieved 4 goals!!", "Kinda depressed", "Helped mom with some house chores", "Didn’t leave my room today", "Bad morning, good evening!", "Look back on my progress so far", "Almost left the house today", "Spoke with Nana-chan", "Today was a nothing day","An anxious and slow day", "Feeling better", "Dad and I", "Ughhhhh", "Dear journal…", "I want to make friends again", "In the garden", "Exercise!", "Today was a good day", "Grandma", "Doctor’s appointment", "Sleep pattern", "Bad dreams", "Mom’s birthday", "This week’s progress", "A sense of relief", "A great day today!"]

  contents = ["I achieved all goals today", "I went to see a doctor", "not feeling well", "I thought I started off my day really well today. I added goals to help mom out around the house and so I helped her to fold some laundry. We watched TV together as we folded up the laundry and it was a really nice afternoon. It’s been great to socialise with her more lately. But dad has still been distant.

    I also wanted to work on running an errand out of the house. I thought I might go to the post office to send a package for my dad but I had that feeling in my chest again. As soon as I started to put on my shoes in the genkan, I started panicking and went back to my room. I didn’t come out for dinner so mom left my food outside my door again.

    When my dad got back from work he suddenly exploded when he saw the undelivered package… I tried to explain that it was too hard today. But, he didn’t want to listen. He shouted at me again about how ashamed he is of me.

    I’m going to try again tomorrow.", "All went wrong", "I made yakisoba which was really good", "Accomplished 4 goals", "I am kinda feeling depressed today", "Helped mom and feeling good", "I didn't leave my room", "I had a bad morning", "It’s been a while since I started using Chrysalis. I can see how I’ve improved but I still have a way to go yet.

    I can’t believe how far I’ve come though. I don’t know if I could have done this alone. When I think back to when I first signed up, I never left my room and my parents were barely speaking to me. Mom understands my feelings a bit more now. I think dad is also coming around and can see that I’m making progress.

    I want to be able to make them proud so I’m going to keep giving myself challenges and keep reaching goals.

    Who knows, maybe I’ll have a job by the end of the year! Let’s only hope.", "Almost left the house, but I couldnt go out", "I called my best friend", "I didn't nothing today", "I feel anxious today", "I am feeling better thant yesterday!", "I love my dad and he has been my hero", "I don't even know how to express my feelings", "I have written journals alsmot for a month", "I want to make friends again", "I saw beautiful flowers in my garden", "I did some exercise today!", "I felt really good today!", "I miss my grandma", "I went to see a foctor today", "I think my sleep pattern is getting better", "I had a nightmare yesterday", "Today was mom's birthday", "It has been really good this week", "I am relieved", "It was an amaging day!"]

  titles.each_with_index do |title, index|
    Journal.create!(
      title: title,
      content: contents[index],
      user: user,
      created_at: Faker::Time.between_dates(from: Date.new(2022, 9, 1) - index, to: Date.new(2022, 9, 1) - index, period: :evening)
    )
  end

  puts "#{Journal.count} journals created"

  puts "Getting goal data"

  55.times do
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

  30.times do
    UserGoal.create!(
      description: "Make my bed",
      user: user,
      status: "inactive"
    )
  end

  24.times do
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

  10.times do
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

  3.times do
    UserGoal.create!(
      description: "Watch TV with my mother",
      user: user,
      status: "inactive"
    )
  end

  5.times do
    UserGoal.create!(
      description: "Take the dog for a walk",
      user: user,
      status: "inactive"
    )
  end

  2.times do
    UserGoal.create!(
      description: "Take the dog for a walk",
      user: user,
      status: "done"
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

  3.times do
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

  2.times do
    UserGoal.create!(
      description: "Take out the trash",
      user: user,
      status: "inactive"
    )
  end

  5.times do
    UserGoal.create!(
      description: "Do my laundry",
      user: user,
      status: "done"
    )
  end

  5.times do
    UserGoal.create!(
      description: "Go to the support centre",
      user: user,
      status: "done"
    )
  end

  4.times do
    UserGoal.create!(
      description: "Go to the convenience store",
      user: user,
      status: "done"
    )
  end

  4.times do
    UserGoal.create!(
      description: "Go to the convenience store",
      user: user,
      status: "inactive"
    )
  end

  puts "#{UserGoal.count} user goals created"
end

# Creating seeds for articles

puts "Destroying article database"
Article.destroy_all

puts "Articles database cleaned"
puts "Getting articles"

Article.create!(title: "To Get Out of Your Head, Get Out of Your House", url: "https://www.theatlantic.com/family/archive/2022/08/how-being-in-nature-improves-health-happiness/671040/", image_url: "https://cdn.theatlantic.com/thumbor/gaXUWpq6vO9gdRR9KSrLRK5R5m0=/0x0:3000x1688/1952x1098/media/img/mt/2022/08/HowToBuildALife103/original.jpg", author: "Arthur C. Brooks")
Article.create!(title: "How to Be Better at Stress", url: "https://www.nytimes.com/guides/well/how-to-deal-with-stress", image_url: "https://static01.nyt.com/images/2017/08/18/insider/well_stressguide-slide-7PI9/well_stressguide-slide-7PI9-jumbo.jpg", author: "Tara Parker-Pope")
Article.create!(title: "How to Make Your Home More Peaceful", url: "https://www.verywellmind.com/elements-of-a-peaceful-home-3144735", image_url: "https://www.verywellmind.com/thmb/j7rM5t9iexvXKGWuccIS-5bY_io=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/peaceful-home-declutter-Charlie-Dean-56b7511c5f9b5829f838459d.jpg", author: "Elizabeth Scott, PhD")
Article.create!(title: "https://www.verywellmind.com/manage-your-anxiety-2584184", url: "https://www.huffingtonpost.co.uk/entry/anxious-to-leave-your-home-as-lockdown-lifts-heres-how-to-push-past-those-fears_uk_5ec3ee18c5b63e39157c004b", image_url: "https://img.huffingtonpost.com/asset/5ec68292220000b11982922e.jpeg?cache=GraaFUZqp4&ops=scalefit_720_noupscale&format=webp", author: "Natasha Hinde")
Article.create!(title: "7 Things You Can Do to Get the Confidence to Leave the House Today", url: "https://www.ditchthelabel.org/7-things-to-get-the-confidence-to-leave-the-house/", image_url: "https://cdn-elmoc.nitrocdn.com/TtdmVVAwLsHTYbPQwFdfDGYjbZkdCjMN/assets/static/optimized/rev-0428eb1/wp-content/uploads/2021/10/jessica-felicio-kgv0t4pI1T4-unsplash1.jpg", author: "Chloe Foster")
Article.create!(title: "When Mental Illness Won't Let Us Leave The House", url: "https://www.blurtitout.org/2020/03/05/mental-illness-leave-house/", image_url: "https://www.blurtitout.org/wp-content/uploads/2020/02/When-Mental-Illness-Wont-Let-Us-Leave-The-House2-rec-text.jpg", author: "Blurt Team")
Article.create!(title: "How to Have Healthy Family Relationships With Less Stress", url: "https://www.verywellmind.com/healthy-family-relationshps-and-stress-relief-3144541", image_url: "https://www.verywellmind.com/thmb/pDc0Y62g_X2Bq-xapIVN_f8MY2Y=/614x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/family-parents-grandparents-Morsa-Images-Taxi-56a906ad3df78cf772a2ef29.jpg", author: "Elizabeth Scott, PhD")
Article.create!(title: "What to Do When You Feel Like You Can't Do Anything Right", url: "https://www.verywellmind.com/what-to-do-when-you-feel-like-you-cant-do-anything-right-5218204", image_url: "https://www.verywellmind.com/thmb/YK5kU3jAk6D2N9UopSdlDTlWqrM=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1054664758-0ef65780ed7d46d2a5d0d64bc12c242c.jpg", author: "Ariane Resnick, CNC")
Article.create!(title: "Why Is It Important to Have Aspirations?", url: "https://www.verywellmind.com/what-are-aspirations-5200942", image_url: "https://www.verywellmind.com/thmb/KtlOTkecSnnrRjpQVoaQ1Pe1PxQ=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-1205454419-a5629f1af0b546f0a3247cd0d41c9949.jpg", author: "Kendra Cherry")
Article.create!(title: "The 7 Best Motivational Books of 2022, According to Mental Health Experts", url: "https://www.verywellmind.com/best-motivational-books-5186249", image_url: "https://images.pexels.com/photos/373465/pexels-photo-373465.jpeg?auto=compress&cs=tinysrgb&w=1600", author: "Simone Scully ")
Article.create!(title: "What to Do If You Don't Know Who You Are", url: "https://www.verywellmind.com/i-dont-know-who-i-am-5186886", image_url: "https://images.pexels.com/photos/5303804/pexels-photo-5303804.jpeg?auto=compress&cs=tinysrgb&w=1600", author: "Kendra Cherry")
Article.create!(title: "How to Deal With Anxiety at Work", url: "https://www.verywellmind.com/cope-with-generalized-anxiety-disorder-at-work-4125397", image_url: "https://www.verywellmind.com/thmb/bW6QhrNuuySuQ2eCdsspyXRs7wE=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/cope-with-generalized-anxiety-disorder-at-work-4125397_final1-bf8d4853906046c2a07b9804aa25a24a.png", author: "Arlin Cuncic")
Article.create!(title: "Highly Effective Strategies to Harness Motivation", url: "https://www.verywellmind.com/highly-effective-strategies-to-harness-motivation-5120217", image_url: "https://www.verywellmind.com/thmb/KrdwmZymZdrlfFhsum6peQGwPsU=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-12238600882-e59cba81dc2844728d2df78ec2e769b5.jpg", author: "Wendy Rose Gould")
Article.create!(title: "'I Hate Myself': 8 Ways to Combat Self-Hatred", url: "https://www.verywellmind.com/i-hate-myself-ways-to-combat-self-hatred-5094676", image_url: "https://www.verywellmind.com/thmb/76EclCjgHUjs0zoRjOYbC6csxgc=/800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/i-hate-myself-ways-to-combat-self-hatred-5094676-a9afa54a8c4744a69171c8c6b7c6a8d7.png", author: "Arlin Cuncic")
Article.create!(title: "What You Can Do to Cope With Anxiety", url: "https://www.verywellmind.com/manage-your-anxiety-2584184", image_url: "https://www.verywellmind.com/thmb/eLSvodLhLzyHiRTqAYnmcyD7s4w=/614x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/manage-your-anxiety-2584184-01-07daf91ba6de41d19f827cf65ceef07a.png", author: "Katharina Star, PhD")

puts "#{Article.count} articles created"

# Creating seeds for addresses of resource locations

puts "Destroying resource locations database"
Location.destroy_all

puts "Resource location database cleaned"
puts "Getting location data"

Location.create!(name: "Tama Youth Support Station", address: "183-2 Shimo, Fussa, Tokyo", phone_number: "042-513-0577", url: "https://www.tamayss.jp/")
Location.create!(name: "Tachikawa Wakasa Support Station", address: "2-9-22 Takamatsucho, Tachikawa-shi, Tokyo", phone_number: "042-529-3378", url: "https://public.sodateage.net/yss/tachikawa/")
Location.create!(name: "Shinjuku Youth Support Station", address: "2-4-7 Nishiwaseda, Shinjuku, Tokyo", phone_number: "03-6380-2288", url: "https://syss.roukyou.gr.jp/")
Location.create!(name: "Setagaya Youth Support Station", address: "4-3-1 Taishido, Setagaya, Tokyo", phone_number: "03-5779-8222", url: "https://www.setagaya-saposute.com/")
Location.create!(name: "Nerima Youth Support Station", address: "4-16-9 Kasuga, Nerima, Tokyo", phone_number: "03-5848-8341", url: "https://kyodonet-nerima.net/")
Location.create!(name: "JOBOTA", address: "1-11-1 Omorikita, Ota, Tokyo", phone_number: "03-6423-0251", url: "https://www.jobota.net/")
Location.create!(name: "Shinjuku City", address: "5-18-21 Shinjuku, Shinjuku, Tokyo", phone_number: "03-5273-3853", url: "http://www.city.shinjuku.lg.jp/fukushi/fukushi01_002056.html")

puts "#{Location.count} resource locations created"
