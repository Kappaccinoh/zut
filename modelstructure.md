# Structure and Relationship between Models
Documentation for Zutapp

//

22 May 2022

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
(Structure is very similar to that of Groupparticipant, but the uses are for different cases)

Room
- ID
- Name
- User_ID
- is_active

Messages
- ID
- User_ID
- Room_ID
- Text

//