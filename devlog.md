## 01-01-2021
-- basic file structure
-- models, inheritance only
-- migration files, first pass, no migration yet

## 01-04-2021
-- coded views/characters
-- copied to GitHub

## 01-05-2021
-- Added concerns/sluggy and included in character and novel models and views
-- Hopefully updated all relevant files to require concerns/sluggy
-- coded /novels/index, /new, /show views
-- coded character and novel edit forms
-- migrated databases, no major problems
-- created and migrated seed data 
-- did some minor bug hunting (bug hunt 1)
-- BUG SMASH (bug hunt 2): fixed the controller reading issue (note: don't forget to 'use' all your controllers in config.ru)

## 01-08-2021
-- added user model, users and sessions controllers, user views
-- deleted sluggy, alas poor sluggy. next time maybe think about broader methods to inherit before coding the databases
-- minor styling
-- created main index landing page
-- added helpers to appcont: 

## 01-11-2021
-- BUG SMASH: some formatting errors, some failure to inherit method errors
-- migrated user class db 
-- associated novels to users (db column add to novels, belongs_to in novel model, has_many in user model)
-- added bcrypt, better late than never
-- had to stop there when shotgun coughed and died 

## 01-12-2021
-- styled index page
-- BUG SMASH syntax errors, so many syntax errors
-- styled user show page, user new page, novels index page w/ and w/o login, novel show page
-- login & logout works
-- styled novel edit and create pages
-- added edit link to novel page and delete button to novel edit page
-- added patch code for novels
-- rerouted characters so charaacters go through novels
-- routed and styled character show pages to show the character name, novel, and associated tropes w/descriptions

## 01-15-2021
-- added modify/delete links at the bottom of the character page
-- patch code entered for characters
-- BUG SMASH. Lots of syntax errors.

## 01-18-2021
-- cleaned up some authorizations/located authorizations needed
-- double checked and added an if-authorized function for viewing the delete button on edit characters/novels views
-- added logged in method to novel controller
-- added flash error messages
-- added flash create/update messages for novels and characters

## 01-26-2021
-- filled out readme and license hahaha oops next time we do this first

## 9 November 2021
-- relocated projectnotes.txt to devlog.md and projectnotes.md
