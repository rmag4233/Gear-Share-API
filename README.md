[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# About The App

As a musician, with many musician friends, I often see people posting on social media, hours before a scheduled gig; 'Help! Does anyone have a guitar amp I can borrow for a couple of hours tonight?!' It's a common problem with a not so desirous solution available currently. The Gear Share app seeks to connect musicians together to allow them to borrow gear from anyone in their community, or the area they are in at the time. Be it for a gig or for recording, for short term or for long term, gearShare will put you in touch with the people you need. The application is in beta version right now.


## Technologies Used

1. Ruby on Rails
2. Heroku

## Planning Phase

With this application, I wanted to use a front end framework with ruby on rails back end. The plan was to develop an application that could serve an immediate, real life purpose. Using Angular 2 provided me with the options to expand the front end routing capabilities as opposed to using a simple, javascript front end. The part I am happiest with is integrating Bootstrap with Angular 2 to create a search functionality that in the future will be iterated on further. There would need to be three backend resources - a user, a piece of equipment(gear) and a loan for two users and a piece of gear to be joined together. For the backend, there was some complexity in conceptualizing how two users would be able to interact with the gear resource, however creating the loans join table with references to the user class as both a borrower and owner made that work as expected.

## How the Front End and Back End interact

The API has three end points - a user, a gear and a loan resource. The API is built in the Ruby on Rails framework. The users resource takes two pieces of credentials information on sign up (an email address and a password). On sign up, the user must pass a password confirmation as well. The user resource requires authentication before performing delete (sign out) and patch (change password) actions. Authentication is secured when a registered user signs in, which is handled by a post request that generates a session token. The authentication sets a current user, which is terminated, along with the session token, upon the user signing out by using the 'Sign Out' button.

The gear resource was built using the bin/rails generate scaffold action which creates a controller for the resource, a model, a serializer, a migration file and adds the resource to the routes.rb file. After reviewing the content of these files for accuracy and making modifications where necessary, I ran the bin/rails db:migrate command to formally add the resource. A user is able to CRUD on the gear resource by being able to view all gears (index/get), add gears (create/post), edit existing gears (update/patch), and delete gears (destroy/delete).

A user can trigger these actions on the front end by the 'All Gears' route (index/get), the 'Add Gear' button (create/post) from their dashboard, once signed in and the 'Edit' (update/patch) and 'Delete' (destroy/delete) buttons that display next to each gear in a users gear list.

The user has a one to many relationship with the gears resource, meaning that one user can have many gears.

The gears table has the following columns, all of which accept string values - Title, Description, Price, Availability, and Image URL. All of these fields are required on the front end validated for presence is true on the back end. There is also a gear id as well as a foreign key for user id on the Gears table.

The gears controller ensures that authentication is required before being accessible and that actions only updated the currently signed in users information. While all users and visitors can view all gears, only an authetnticated current user can create, update and delete.

The loan resource is a table that holds the borrower id, owner id(of the piece of gear being borrowed), gear id being borrowed, loan start and loan end dates. The loan gets created when an authenticated user sees a piece of equipment that they would like to borrow and request a loan on the front end. This loan then appears in the owner of the pieces equipment Loans section on their dashboard. From their, they can choose to accept the request (add start and end dates and make communication with the borrower), this makes an update to the loans resource. From the front end, a user can not delete a loan, but the backend is set up to only allow the user who created the loan to delete it.

*Credit to GA WDI-LM02 cohort student, Brian Distefano for the user authentication code used for user sign up, login, sign out and change password functionality in this application.

## User Actions

| Verb   | URI Pattern                   | Controller#Action    |
|--------|-------------------------------|----------------------|
| POST   | `/sign-up`                    |    `users#signup`    |
| POST   | `/sign-in `                   |    `users#signIn`    |
| PATCH  | `/change-password/:id `       |  `users#changepw`    |
| DELETE | `/sign-out/:id `              |   `users#signout`    |

## Gear Actions

| Verb   | URI Pattern                   | Controller#Action    |
|--------|-------------------------------|----------------------|
| GET    | `/gears`                      |    `gears#index`     |
| GET    | `/gears/:id `                 |    `gears#show`      |
| PATCH  | `/gears/:id `                 |  `gears#update`      |
| DELETE | `/gears/:id `                 |   `gears#destroy`    |
| POST   | `/gears `                     |   `gears#create`     |

## Loan Actions

| Verb   | URI Pattern                   | Controller#Action    |
|--------|-------------------------------|----------------------|
| GET    | `/gears`                      |    `gears#index`     |
| GET    | `/gears/:id `                 |    `gears#show`      |
| PATCH  | `/gears/:id `                 |  `gears#update`      |
| DELETE | `/gears/:id `                 |   `gears#destroy`    |
| POST   | `/gears `                     |   `gears#create`     |

*While a loan can be destroyed, for auditing purposes, we keep don't provide the end user with a way to destory a loan through the front end.

## ERD

ERD -

https://i.imgur.com/ta75TEL.jpg


## Future Iterations

In future iterations of this project, I would like to build out search functionality. Right now, a user is able to search by the title of the piece of equipment they are looking for. In the future, I would like to interact with a third party API that will take in a zip code entered by the user and a radius in miles that they are willing to travel for the equipment to turn the results. I had found an npm package, but alas it didn't work with Angular 2.

## Links to Deployed Sites

Front End -
https://rmag4233.github.io/Gear-Share/

Back End -
https://my-gear-share.herokuapp.com/

## Repo for Front End
https://github.com/rmag4233/Gear-Share
