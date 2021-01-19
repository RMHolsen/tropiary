class SessionsController < ApplicationController
    
    get '/login' do
        #Login page
        erb :"/sessions/new"
    end 

    post '/login' do
        #Logs the user in and authenticates and starts a session, goes to user's home page.
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
            #alternately:
            #if @user.try(:authenticate, params[:password])
        else 
            flash[:login_error] = "Login error, please try again."
            redirect "/login"
        end 
    end 

    get '/logout' do
        #logs user out
        session.destroy
        redirect '/login'
    end 
end  