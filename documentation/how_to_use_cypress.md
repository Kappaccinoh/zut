# Guide to Cypress
https://docs.google.com/document/d/15hThARV33g5dXAgMfjl2eJULqDBqoAsUk3-DeTcaIms/edit

## How to run rake commands on your test database?

bundle exec rake db:drop db:create db:migrate db:seed RAILS_ENV=test

you may need to run-> bin/rails db:environment:set RAILS_ENV=test

to convert back to development
bin/rails db:environment:set RAILS_ENV=development
## Tests will fail if they receive a browser error, e.g console log errors
add the following code to your on-rails.js

Cypress.on('uncaught:exception', (err, runnable) => {
  // returning false here prevents Cypress from
  // failing the test
  return false
})

## Installation of backend and how to run basic tests
https://nebulab.com/blog/cypress-for-rails-developers


## USAGE - HOW TO USE ACCESS THE CYPRESS UI
https://github.com/shakacode/cypress-on-rails

CYPRESS=1 bin/rails server -p 5017
starts your server on port 5017* (not sure development or test)

yarn cypress open
in a separate terminal, this starts up the cypress UI

