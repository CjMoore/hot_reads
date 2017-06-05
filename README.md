# HotReads
HotReads is a companion application for URLockbox. This application makes a note when a link is read on URLockbox across all users and prints out a list of the top-10 most read links.

## Tech Stack
Rails version 4.2.2

## Setup
* To run locally
  * Clone this repo
  * run `bundle`
  * run `rails s` to start the server
  * open `localhost:3000` in browser
* Production  
  * The production link for this application is located [here](https://hot-reads-cjm.herokuapp.com/)

## Testing
* This application uses RSpec for testing
* To run the tests use the command `rspec`

## API docs
This application has two API endpoints

* POST '/api/v1/links' checks to see if a link is already stored as a hot read. If so it increments a counter so the DB keeps track of the most read links. Either way, this endpoint returns the most read links.
* GET '/api/v1/links' returns the most read links. 
