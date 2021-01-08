class ApplicationController < Sinatra::Base
  use Rack::Flash
    configure do 
    set :views, proc { File.join(root, '../views/') }
    #Sets the views folder to the, well, views folder
    #So that all views/erbs are automatically looking in that folder 
    #Hence "erb: "application/index" or what have you
    #... maybe I should actually make that
    enable :sessions
    set :session_secret, "setecastronomy"
    end 

    #register Sinatra::Twitter::Bootstrap::Assets
    #Not sure what this does 
  
    get '/' do
      erb :"index"
    end
    
    helpers do
      #These methods are available to the controllers and the views both
      def logged_in?
        !!current_user
      end 

      def current_user
        @user ||= User.find(session[:user_id]) if session[:user_id]
      end 

      def authenticate_me
        if !logged_in?
          #flash notice here, something suitably snarky
          redirect "/"
          #Redirects to the main page
        end 
      end 
    end 

  end