# zut
From "A Gentleman in Moscow", the game of zut played by Alexander Rostov and Sophia made into a webapp

# Currently Working on
- Coop vs Competitive mode?

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# BUGS
- Seeding Database Bug, likely caused by turbo trying to render a template each time a new user is created into the database
    - :002 > User.create(username: "Drake")
    TRANSACTION (0.2ms)  BEGIN
    User Exists? (15.7ms)  SELECT 1 AS one FROM "users" WHERE "users"."username" = $1 LIMIT $2  [["username", "Drake"], ["LIMIT", 1]]
    User Create (40.8ms)  INSERT INTO "users" ("username", "created_at", "updated_at") VALUES ($1, $2, $3) RETURNING "id"  [["username", "Drake"], ["created_at", "2022-06-11 09:29:34.542634"], ["updated_at", "2022-06-11 09:29:34.542634"]]
    TRANSACTION (3.9ms)  COMMIT                          
    Rendered users/_user.html.erb (Duration: 5.9ms | Allocations: 2697)
    /Users/jiawei/.rvm/gems/ruby-3.1.0/gems/actionpack-7.0.2.4/lib/action_dispatch/journey/formatter.rb:44:in `path': No route matches {} (ActionView::Template::Error)
    /Users/jiawei/.rvm/gems/ruby-3.1.0/gems/actionpack-7.0.2.4/lib/action_dispatch/journey/formatter.rb:44:in `path': No route matches {} (ActionController::UrlGenerationError)


# BACKLOG
1. Minor UI Related Issues
- UI for general game interface, layouts, where players will show up as
- Interface for word clearance, strikethrough? animated sliding on the textarea once a word is cleared?
- Clean up interface w Bootstrap/CSS
- Homepage Tab system to filter (in progress, available, your owned rooms, joined rooms)
- Player Screen Interface/Game Room Interface
- Scoreboard to keep track of words answered by each participant?


2. Minor Backend Setup
- Create Cypress Tests for existing screens
- Homepage smoothen UI/UX
    - If current turn join now
    - If not your turn remove link to join
- Room smoothen UI/UX 
    - Pop up style upon clicking the start game?
    - Use Bootstrap's Modals


3. Game Mechanics Setup (Major Backend)
- Set up and Display Timer function, lock the room once the timer has started, unlock the room after the timer has finished (likely will use actioncable and websockets -> need more research)
- Set up Cypress 'seeds' to populate database on testing env
- New model to relate what categories are available? (Not sure how this works)


4. Future, External Plans
- Host it on an app for people to access?
- Convert website to an app?
- Profile for each player?
- Explore ActionCable and Websockets


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
- (DONE) Set up Seeds to populate the database on first load
- (DONE) Dont allow for a blank space room to be created
- (DONE) Dont allow for a blank space message to be created
- (DONE) Fixed small @is_groupcreator bug due to controller logic

3. Game Mechanics Setup (Major Backend)
- (DONE) Show which rooms are in progress
- (DONE) Figure out destroy issue with pg's relational database set up (n.b no room dependent: :destroy with GameTurn)
- (DONE) Figure out how to do the back and forth toggling between players (start with a button on the room page first)
- (DONE) Set up Turbo listening for other tags to get real time updates without having to refresh page
- (DONE) Set up Databases worth of words for each category (pokemon, famous people, famous/historic places, animals)
- (DONE) Selection of What Category The Room Creator wants to play
    - Will need to retrieve all categories available
- (DONE) Rotate the players each time a message is sent (likely required integration and listening from ActionCable/Websockets)
    - Have a fixed bag of words e.g flowers, countries etc
    - checked boolean column
    - if message sent matches one of the words in the dictionary, update the database
    - PLANNED STRUCTURE
        - Similar to voting metrics structure
        - One dedicated Table for each category, first 500/1000 rows is the "template"
        - When a game is created, add on more rows for that particular table with the corresponding game_id
            - meaning each time a new game room goes live, another 500/1000 rows are added to that table
            - and removed after one the game closes
            - table for that particular game_id is updated true and false when a message is sent
    - Update the GameTurn model if a correct answer is sent


4. Future External Plans
- (DONE) Explore Testing options using Cypress

5. Meta Installation
- (DONE) Installing and Get SASS & Bootstrap Working
- (DONE) Setting Up JQuery




