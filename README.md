# Makersbnb
Makers Week 6 Group Project

<INSERT DESCRIPTION OF PROJECT>

MakersBnB specification
We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

### Headline specifications
- Any signed-up user can list a new space. 
    - it is done when: a user can sign up for an account
    - it is done when: a signed up user can send a request to another user to hire a space
    - it is done when: a user can send a request to another user
    - it is done when: a user can accept or decline a request from another user
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night. 
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

##### User stories: Headline specifications
As a user,
So I can list my room to rent as myself,
I want to be able to sign up for an account

As a user, 
So I can list my room to rent as myself, 
I want to be able to log in as me.

As a user,
So no one makes a booking as me, 
I want to be able to log out.

As a user,
So I can advertise my space,
I want to be able to list my space.

As a user, 
So I can list all my spaces, 
I want to be able to list multiple spaces/rooms at once.

As a user, 
So I can let people know the details of my space,
I want to be able to enter details of my space: name, description, price.

As a user, 
So I can let people know when the space is available,
I want to be able to list a range of dates of availability.

As a user, 
So I can see what spaces are available,
I want to be able to see a list of all spaces

As a user,
So I can hire a space for a night,
I want to be able to send a request to hire a space.

As a user,
So I can don't try to book a space that isn't available,
I want to not be able to send a request to hire a space if it's not available.

As a user,
So I can respond to requests,
I want to be able to see my messages from other users.

As a user,
So I can respond to requests,
I want to be able to approve or deny requests.

As a user, 
So I avoid double booking, 
I want to remove spaces from availability once the booking has been confirmed.

#### Nice-to-haves
- Users should receive an email whenever one of the following happens:
- They sign up
- They create a space
- They update a space
- A user requests to book their space
- They confirm a request
- They request to book a space
- Their request to book a space is confirmed
- Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
- A user requests to book their space
- Their request to book a space is confirmed
- Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

-- book for multiple nights

##### User Stories: Nice-to-haves

<ENTER USER STORIES FOR NICE-TO-HAVES>

## MVP 
- Users should be able to list a property
- Users should be able to name their space, provide a short description of the space, and a price per night. 
- Users should be able to offer a range of dates where their space is available.


### User Stories: MVP

As a user,
So I can advertise my space,
I want to be able to list my space.

As a user, 
So I can let people know the details of my space,
I want to be able to enter details of my space: name, description, price.

As a user, 
So I can let people know when the space is available,
I want to be able to list a range of dates of availability.