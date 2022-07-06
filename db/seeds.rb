# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seeding Users // look at how to prevent the error from being thrown in the future, likely it is because of turbo
# puts "Seeding Users..."
# User.find_or_create_by(username: "Elon")
# User.find_or_create_by(username: "Drake")
# User.find_or_create_by(username: "Trump")

# Seeding Rooms
puts "Seeding Rooms..."
Room.find_or_create_by(user_id: 1, name: "PLACE HOLDER")
Room.find_or_create_by(user_id: 1, name: "People")
Room.find_or_create_by(user_id: 1, name: "Places")
Room.find_or_create_by(user_id: 3, name: "Pokemon")

# Seeding GroupParticipants
puts "Seeding GroupParticipants..."
Groupparticipant.find_or_create_by(user_id: 1, room_id: 2)
Groupparticipant.find_or_create_by(user_id: 2, room_id: 2)
Groupparticipant.find_or_create_by(user_id: 1, room_id: 3)
Groupparticipant.find_or_create_by(user_id: 2, room_id: 3)
Groupparticipant.find_or_create_by(user_id: 3, room_id: 3)


# Seeding FamousFoursomesCategoryAnswer
puts "Seeding FamousFoursomesCategoryAnswer..."
FamousFoursomesCategoryAnswer.find_or_create_by(id: 1, room_id: 1, answer: "Spring, Summer, Autumn, Winter")
FamousFoursomesCategoryAnswer.find_or_create_by(id: 2, room_id: 1, answer: "Earth, Water, Fire, Air")
FamousFoursomesCategoryAnswer.find_or_create_by(id: 3, room_id: 1, answer: "North, South, East, West")
FamousFoursomesCategoryAnswer.find_or_create_by(id: 4, room_id: 1, answer: "Diamonds, Hearts, Clubs, Spades")
FamousFoursomesCategoryAnswer.find_or_create_by(id: 5, room_id: 1, answer: "Bass, Tenor, Alto, Soprano")
FamousFoursomesCategoryAnswer.find_or_create_by(id: 6, room_id: 1, answer: "Matthew, Mark, Luke, John")
FamousFoursomesCategoryAnswer.find_or_create_by(id: 7, room_id: 1, answer: "Boreas, Zephyrus, Notos, Euros")
FamousFoursomesCategoryAnswer.find_or_create_by(id: 8, room_id: 1, answer: "Yellow Bile, Black Bile, Blood, Phlegm")

# Seeding BlackAndWhiteAnimalsCategoryAnswer
puts "Seeding BlackAndWhiteAnimalsCategoryAnswer..."
BlackAndWhiteAnimalsCategoryAnswer.find_or_create_by(id: 1, room_id: 1, answer: "Penguin")
BlackAndWhiteAnimalsCategoryAnswer.find_or_create_by(id: 2, room_id: 1, answer: "Puffin")
BlackAndWhiteAnimalsCategoryAnswer.find_or_create_by(id: 3, room_id: 1, answer: "Skunk")
BlackAndWhiteAnimalsCategoryAnswer.find_or_create_by(id: 4, room_id: 1, answer: "Panda")
BlackAndWhiteAnimalsCategoryAnswer.find_or_create_by(id: 5, room_id: 1, answer: "Killer Whale")
BlackAndWhiteAnimalsCategoryAnswer.find_or_create_by(id: 6, room_id: 1, answer: "Dalmation")
BlackAndWhiteAnimalsCategoryAnswer.find_or_create_by(id: 7, room_id: 1, answer: "Peppered Moth")

puts "Seeding Completed"