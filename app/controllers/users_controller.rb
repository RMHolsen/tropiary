class UsersController < ApplicationController
    
    get '/signup' do 
        erb :"/users/new"
    end 

    post '/users' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
        else 
            #Flash message indicating an invalid username or password or forgot to fill in a field
            redirect '/signup'
        end 
    end 

    get '/users/:id' do
        @user = user.Find(params[:id])
        erb :"/users/show"
    end 

    get '/logout' do
        #Flash message for logout?
        session.destroy
        redirect '/login'
    end 

end 