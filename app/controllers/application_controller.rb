class ApplicationController < Sinatra::Base
    set :views, proc { File.join(root, '../views/') }
    #Sets the views folder to the, well, views folder
    #So that all views/erbs are automatically looking in that folder 
    #Hence "erb: "application/index" or what have you
    #... maybe I should actually make that

    #register Sinatra::Twitter::Bootstrap::Assets
    #Not sure what this does 
  
    get '/' do
      erb :"application/index"
    end
    

    #login/logout sessions probably go here
  end