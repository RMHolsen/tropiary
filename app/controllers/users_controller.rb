class UsersController < ApplicationController
    
    get '/signup' do 
        erb :"/users/new"
    end 

    post '/users' do
        #binding.pry
        user = User.new(params)
        #Creates a new user with the information in the params
        if user.save
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
            #If the user fills in all the params and therefore can save
            #Set a session id and shunt the user to their home page
        else 
            #Flash message indicating an invalid username or password or forgot to fill in a field
            redirect '/signup'
        end 
    end 

    get '/users/:id' do
        #User home page
        @user = User.find(params[:id])
        erb :"/users/show"
    end 

end 