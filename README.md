# zut
From "A Gentleman in Moscow", the game of zut played by Alexander Rostov and Sophia made into a webapp

# TODO:
1. Minor UI Related Issues
- UI for general game interface, layouts, where players will show up as
- Interface for word clearance, strikethrough? animated sliding on the textarea once a word is cleared?
- Clean up interface w Bootstrap/CSS

2. Minor Backend Setup
- (DONE) Show which rooms a player has already joined
- (DONE) Owner should be able to delete each game room
- (DONE) Back Button in each game room to navigate back to homescreen
- (DONE) Show Rooms which a player has already created
- Set up Turbo listening for other tags to get real time updates without having to refresh page

3. Game Mechanics Setup (Major Backend)
- Set up and Display Timer function, lock the room once the timer has started, unlock the room after the timer has finished
- Coop vs Competitive mode?
- Set up Databases worth of words for each category (pokemon, famous people, famous/historic places, animals)
- Alternating between players in competitive mode
- Scoreboard to keep track of words answered by each participant?
- Show which rooms are in progress