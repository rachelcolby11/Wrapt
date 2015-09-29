# [Wrapt - bringing the joy back to giving!](https://wrapt.herokuapp.com/) 

Wrapt is a Ruby on Rails application that allows users to create a wishlist of gifts and view their friends'​ lists as well. Users can access up-to-date wishlists from their friends and family all in one place, and update their own wishlist at any time, making gift-giving easier and more gratifying for everyone involved.

* The app is deployed on Heroku: https://wrapt.herokuapp.com 
* The source code is here on GitHub: https://github.com/rachelcolby11/Wrapt

This app was created as my capstone project for Bloc.io's Full Stack Web Development Course.

## Setup and Configuration
**Languages and Frameworks:** 
Ruby on Rails and Bootstrap

**Ruby version 2.0.0**

**Databases:** SQLite (Test, Development), PostgreSQL (Production)

**Development Tools and Gems:** 
* Devise for user authentication
* SendGrid for email notifications
* Pundit for authorization

####**Setup:**
* Environment variables were set using [Figaro] (https://github.com/laserlemon/figaro) and are stored in config/application.yml (ignored by git)
* The config/application.example.yml file illustrates how environment variables should be stored

####**To run Wrapt locally:**
- Clone the repository
- Run `bundle install`
- Create and migrate the SQLite3 database with `rake db:create` and `rake db:migrate`
- Start the server using `rails server`
- Run the app on `localhost:3000` 

## Features
* Users can create an account, make a profile describing their preferences, and create a list of gifts they would like to receive.
* Users can share their profile and gift list with other users, allowing them to view their preferences and desired items.
* Users can invite friends and family to join the site and view their gift list.
* Users can view a list of friends who can see their gift list, and a list of friends who have allowed them to view their lists.
* Users can add, edit, or remove items from their gift list, and update their profile and preferences at any time.
* Users can restrict viewing permissions on items so that only certain friends can see them.
* Users can "claim" an item they plan to purchase. (The person who created the item cannot see that the item has been claimed.)
* Seven days after claiming a gift, users receive a reminder to purchase the gift or release their claim so that others can purchase it.
* Users can create, edit, and delete quick notes of gift ideas they think of.
* After signing in, users are directed to a dashboard showing the items they have claimed, the notes they have made, and a list of friends whose birthdays are approaching within the next three months. 
* Users who still need to fill out their profile or add their birthday will see a reminder to do so at the top of the dashboard.
