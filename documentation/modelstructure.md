# Structure and Relationship between Models
Documentation for Zutapp

//

19 June 2022

User
- ID
- Username

Groupparticipant (Note that groupparticipants include the creator of the group as well)
- ID
- User_ID
- Room_ID

GameTurn
- ID
- User_ID
- Room_ID
- Array of players

Room (Note that you can't delete a Room if it is currently active)
- ID
- Name
- User_ID
- is_active
- Category (String) // Find a better way to do this via enums/relation
- game_mode (String)

Messages // Note Messages for a particular room are all destroyed when it changes from active to not active
- ID
- User_ID
- Room_ID
- Text

DATABASE_Category_Answers (GENERIC STRUCTURE OF CATEGORIES)
- ID
- Room_ID -> original copies of the answers will have a default value of 1
- String
- Boolean

//