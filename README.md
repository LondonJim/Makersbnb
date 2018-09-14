# MakersBnB

MakerBnB is a web application that allows users to both list their spaces for hire, and hire spaces from other users.

Tags: Ruby, Rspec, Capybara, JavaScript, ActiveRecord, JQuery, PG, Sinatra 

### Domain Model

![Imgur](https://i.imgur.com/WWyeSFv.png)

### Database Model


###  Setup Instructions
```
$ git clone git@github.com:hjpugh/Makersbnb.git
$ bundle
```

#### Database

We used a cloud database solution, in our case we used ElephantSQL.
Once a account was made you need to insert the following in to an .env file, which will need to be added to the root directory. The url is supplied by the database you have set up.

Example of .env file

```
export URL_TEST="postgres://gThdgfjq:iGFhYUjWFc94ttnkuv7fD5GepIKZ9s1@dumbo.db.elephantsql.com:5432/gThdgfjq"

export URL="postgres://qhdgpsjh:1gshduHgCeGkHi923uhW57gha_KA1fCT@dumbo.db.elephantsql.com:5432/qhdgpsjh"

```

### Technologies Used
Ruby

		ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]

RSpec

		RSpec 3.8

Sinatra

		sinatra 2.0.3


		
##User stories
```
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
```