class SessionsController < ApplicationController
    
    get '/login' do
        erb: "/sessions/new"
    end 

    post '/login' do
        @user = User.find_by(username: params[:username])
        if user.try(:authenticate, params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
            #alternately:
            #if user && user.authenticate(params[:password])
        else 
            #flash message that says incorrect username or password
            redirect "/login"
    end 
end  