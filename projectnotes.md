## To do:

## Stretch Goals
-- make genre a separate model, albeit a simple one: a novel has_many genres. Then add a show page to search novels by genre.
-- maybe add a public novel index page so people can view other people's novels without editing them?
-- in which case you'll need a button and a boolean column so users can toggle it public/not-public
-- maybe add an active/inactive boolean column to the novel thing
-- make and run tests for no real reason, just so you know you can
-- do something with the tropes page?

## Bugs: 
-- creating a novel does not include the synopsis posting to the new novel page (is this a validation thing?)

## Notes: 
-- slugging and unslugging: artists and modules lab, Intro to Modules reading
-- login >> user index of novel projects >> novel: genre, word count, characters, edit option (list of tropes?) >> character >> edit option, list of tropes
-- authentication vs authorization 
-- update method will save, and thus will also trigger validation (making sure all fields have data)
-- validates method in the model also has an 'on: :create' so you can only validate at a certain point; this doesn't apply here.
-- erbs do not render http requests, just pull files
-- colors: 870d10, b05e60, d79392, 6e1418, f2babb, fce7e1, 973c3c, fad2ce
-- post route for new novels @novel = current_user.novels.build(params go here) followed by if @novel.save
-- in the edit view: IF current_user.id == @novel.user_id THEN render the erb ELSE flash message no touchy and redirect to index
(can probably also add this to create pages)
-- @novel = current_user.novels.find(params[:novel]), @character = @novel.characters.find(params[:id])

## Project Goals:
-- Build an M(odel)V(iews)C(ontroller) Sinatra application. DONE
-- Use ActiveRecord with Sinatra. DONE
-- Use multiple models. DONE
-- Use at least one has_many relationship on a User model and one belongs_to relationship on another model. DONE
-- Must have user accounts - users must be able to sign up, sign in, and sign out. DONE
-- Validate uniqueness of user login attribute (username or email). DONE
-- Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user. DONE
-- Ensure that users can edit and delete only their own resources - not resources created by other users. DONE 
-- Validate user input so bad data cannot be persisted to the database. DONE
-- BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!) DONE
