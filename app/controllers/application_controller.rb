require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
    configure do 
    set :views, proc { File.join(root, '../views/') }
    #Sets the views folder to the, well, views folder
    #So that all views/erbs are automatically looking in that folder 
    #Hence "erb: "application/index" or what have you
    enable :sessions
    set :session_secret, "setecastronomy"
    #Enabling individual sessions and setting a security password/scramble ... thing.
    end  
  
    get '/' do
      #Main landing page, no special function
      erb :"index"
    end

    get '/tropes' do
      #Trope index, no special function except to iterate over tropes and print them to the page
      @tropes = Trope.all
      erb :"/tropes/index"
    end 

    get '/tropes/new' do
      #Create a new trope form
      erb :"/tropes/new"
    end 

    post '/tropes' do 
      #Create a new trope receives data and creates the object.
      Trope.create(name: params[:name], descrip: params[:descrip])
      redirect to "/tropes"
    end 

    get '/tropes/:slug/edit' do 
      #Find the trope by the trope slug
      @trope = Trope.find_by_slug(params[:slug])
      erb :"/tropes/edit"
    end 

    patch '/tropes/:slug' do 
      #Find the trope by slug and edit it, redirect to the index page
      @trope = Trope.find_by_slug(params[:slug])
      @trope.name = params[:name]
      @trope.descrip = params[:descrip]
      @trope.save
      redirect to "/tropes"
    end 
    
    helpers do
    #These methods are available to the controllers and the views both

      def logged_in?
        #Is there a current user? True/False 
        !!current_user
      end 

      def current_user
        #Using the or-equals method because EITHER the @user is present and the rest of the method doesn't need to be used
        #OR we need to find and set the user variable based on the session id
        @user ||= User.find(session[:user_id]) if session[:user_id]
      end 

      def verify_me
        #Authorisation vs authentication = is your voice your correct passport.
        if !logged_in?
          #flash notice here, something suitably snarky
          redirect "/"
          #Redirects to the main page
        end 
        #Ultimately I don't think I actually needed this method but it's staying in the act forever.
      end 

      def authorize(novel)
        #Shortcut instead of writing "is this person authorized" all over the place 
        current_user.id == novel.user_id 
      end 
    end 

  end