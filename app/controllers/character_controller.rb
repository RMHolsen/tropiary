class CharacterController < ApplicationController

    get '/characters' do
        @characters = Character.all
        #Character Index
        #Shows all the characters with links to their pages
        #Doesn't NEED to show the novel related to them, self, really
        #That's for future functionality
        erb :"/characters/index"
    end 

    get '/characters/new' do
        @novels = Novel.all
        @tropes = Trope.all 
        #Loads form to create a new character, with Tropes and Novels
        #Also contains options to create a new novel and a new trope
        erb :"/characters/new"
    end 

    post '/characters' do
        @character = Character.create(name: params[:character][:name], novel_id: params.key("on"))
        if !params["novel"]["name"].empty?
            @character.novel = Novel.create(title: params[:novel][:title])
            @character.save
        end 
        #Some form of saving the tropes goes here
        #Check the params IDK I am very tired and not feeling well.
        redirect to "/characters/#{@character.slug}"
    end 

    get '/characters/:slug' do
        @character = Character.find_by_slug(params[:slug])
        @novel = @character.novel
        erb :"/characters/#{@character.slug}"
        #maybe make this a slug instead of an id
    end 

    get '/characters/:slug/edit' do
        @character = Character.find_by_slug(params[:slug])
        @novels = Novel.all
        @tropes = Trope.all
    end 

    patch '/characters/:slug/edit' do
    end 
end 