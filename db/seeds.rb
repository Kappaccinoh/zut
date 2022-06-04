# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seeding Users
User.create(username: "Elon")
User.create(username: "Drake")
User.create(username: "Trump")

# Seeding Rooms
Room.create(user_id: 1, name: "People")
Room.create(user_id: 1, name: "Places")
Room.create(user_id: 2, name: "Pokemon")

# Seeding GroupParticipants
Groupparticipant.create(user_id: 1, room_id: 1)
Groupparticipant.create(user_id: 2, room_id: 1)
Groupparticipant.create(user_id: 3, room_id: 1)
