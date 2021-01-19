class UsersController < ApplicationController
    
    get '/signup' do 
        #Form to create new user
        erb :"/users/new"
    end 

    post '/users' do
        #Creates a new user with the information in the params
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
            #If the user fills in all the params and therefore can save
            #Set a session id and shunt the user to their home page
        else 
            flash[:input_error] = "Account creation incomplete. Please try again."
            redirect '/signup'
        end 
    end 

    get '/users/:id' do
        #User home page
        @user = User.find(params[:id])
        erb :"/users/show"
    end 

end 