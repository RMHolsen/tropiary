class SessionsController < ApplicationController
    
    get '/login' do
        erb :"/sessions/new"
    end 

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
            #alternately:
            #if @user.try(:authenticate, params[:password])
            #If the user is authenticated by password and existence of username
            #Set the session id and redirect to the user's home page
        else 
            #flash message that says incorrect username or password
            redirect "/login"
        end 
    end 

    get '/logout' do
        #Flash message for logout?
        session.destroy
        redirect '/login'
    end 
end  