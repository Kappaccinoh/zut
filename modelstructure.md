# Structure and Relationship between Models
Documentation for Zutapp

//

18 May 2022

User
- ID
- Username

Groupparticipant
- ID
- User_ID
- Room_ID

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