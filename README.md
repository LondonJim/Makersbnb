# MakersBnB

MakerBnB is a web application that allows users to both list their spaces for hire, and hire spaces from other users.

Tags: Ruby, Selenium, Rspec, Capybara, Javascript, Jasmine, ActiveRecord, Sqlite3

### Domain Model

![Imgur](https://i.imgur.com/WWyeSFv.png)

### Database Model


###  Setup Instructions
```
$ git clone git@github.com:hjpugh/Makersbnb.git
$ gem install bundler
$ bundler
$ create:db makersbnb_test
$ create:db makersbnb_development
```

<!-- Figure out how we're showing the databases -->

##### User stories

As a user,
So I can list or hire a space,
I want to be able to sign up for a MakersBnB account

As a signed-up user,
So I can access my spaces and messages,
I want to be able to log in as me

As a logged-in user,
So no one has access to my messages and spaces,
I want to be able to log out

As a logged-in user,
So I can advertise my space,
I want to be able to list my space with it's details
  - it is done when a user can add a space
  - it is done when the space details are listed on the site

As a logged-in user,
So I can advertise all my free spaces,
I want to be able to list multiple spaces on one account

As a logged-in user,
So I can show when my spaces are available,
I want to add dates of availability to my space listing
<!-- Currently individual dates, hopefully soon add a range -->

As a logged-in user,
So I can hire someone else's space,
I want to be able to send a request to hire a space for one night

As a logged-in user,
So I have final say on who can rent my space out,
I want to be able to approve or deny requests from others.
  - it is done when a user can see requests from other members
  - it is done when a user can approve or deny requests

As a logged-in user,
So that my spaces are not double booked, 
I want space availability to be removed from the space once a request is accepted.
  - it is done when an accepted request removes the availability from listing
  - it is done when availability remains unless the request is accepted
<!--
As a user,
So I can don't try to book a space that isn't available,
I want to not be able to send a request to hire a space if it's not available. -->

<!-- As a user,
So can keep up to date with MakersBnB
I want to receive emails whenever something happens with my account -->
