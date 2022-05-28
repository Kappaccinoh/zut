# zut
From "A Gentleman in Moscow", the game of zut played by Alexander Rostov and Sophia made into a webapp

# TODO:
1. Minor UI Related Issues
- UI for general game interface, layouts, where players will show up as
- Interface for word clearance, strikethrough? animated sliding on the textarea once a word is cleared?
- Clean up interface w Bootstrap/CSS
- Homepage Tab system to filter (in progress, available, your owned rooms, joined rooms)

2. Minor Backend Setup
- Set up Turbo listening for other tags to get real time updates without having to refresh page

3. Game Mechanics Setup (Major Backend)
- Set up and Display Timer function, lock the room once the timer has started, unlock the room after the timer has finished
- Coop vs Competitive mode?
- Set up Databases worth of words for each category (pokemon, famous people, famous/historic places, animals)
- Scoreboard to keep track of words answered by each participant?
- Figure out how to do the back and forth toggling between players


# Done/Log
2. Minor Backend Setup
- (DONE) Show which rooms a player has already joined
- (DONE) Owner should be able to delete each game room
- (DONE) Back Button in each game room to navigate back to homescreen
- (DONE) Show Rooms which a player has already created
- (DONE) Create a way to lock and unlock the room -> in preparation for playing the game
- (DONE) Need logic to start a game with minimum 2 players AND flash error message
- (DONE) Only group creator can start or end a game
- (DONE) Locked Rooms cannot be left or joined

3. Game Mechanics Setup (Major Backend)
- (DONE) Show which rooms are in progress
- (DONE) Figure out destroy issue with pg's relational database set up (n.b no room dependent: :destroy with GameTurn)



