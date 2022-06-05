# You can setup your Rails state here
# MyModel.create name: 'something'

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