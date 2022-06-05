# This file contains some common problems/bugs that zutapp might face when launching

1. Javascript/Jquery not working/loading on a page
- close all terminals
- run: rake assets:clean
- run: rake assets:precompile
- start up the server and try again

2. since application is already imported, you dont need to pin room.js in (importmap.rb)

importmap.rb
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
(Optional) pin "app/javascript/room", to: "room.js", preload: true

javascript/application.js
import "@hotwired/turbo-rails"
import "./controllers"
import "./room.js"

3. not sure when to pin and when to require and when to import, although require seems to be giving the most problems
e.g (//= require_tree .) causes many problems

4. do I need to precompile each time I change my Javascript Folders 
answer: No, just configure (production.rb) as such:
    config.assets.compile = true

5. Accessing Test Console vs Development Console
rails c
rails c -e test
