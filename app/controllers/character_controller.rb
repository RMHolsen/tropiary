class CharacterController < ApplicationController

    #get '/characters' do
        #@characters = Character.all
        #Character Index
        #Shows all the characters with links to their pages
        #Doesn't NEED to show the novel related to them, self, really
        #That's for future functionality
        #erb :"/characters/index"
    #end 
    #THIS FORM OF CHARACTER INDEX NOW OBSOLETE

    get '/novels/:novel_slug/characters' do
    #Displays the list of characters in each novel
    @novel = Novel.find_by_slug(params[:novel_slug])
        if current_user.id == @novel.user_id 
            @characters = @novel.characters.all 
            erb :"/characters/index"
        else 
            redirect to "/"
        end 
    end 

    get '/novels/:novel_slug/characters/new' do
    #Loads form to create a new character for a specific novel
    @novel = Novel.find_by_slug(params[:novel_slug])
    @tropes = Trope.all
    erb :"/characters/new"
    end 

    post '/novels/:novel_slug/characters' do 
    @novel = Novel.find_by_slug(params[:novel_slug])
        if current_user.id == @novel.user_id 
            @character = Character.create(name: params[:name])
            @character.novel = @novel 
            @tropes = params[:trope_ids]
                @tropes.each do |t|
                    @character.tropes << Trope.find(t)
                end 
            @character.save 
            #Creates a new character for a specific novel based on parameters
            #Renders the character index for the novel
            redirect to "/novels/#{@novel.slug}/characters"
        else 
            redirect to "/"
            #flash message you bad person
        end 
    end 

    get '/novels/:novel_slug/characters/:slug' do
    #Displays a specific character page
    @novel = Novel.find_by_slug(params[:novel_slug])
    @character = Character.find_by_slug(params[:slug])
    @tropes = @character.tropes 
    erb :"/characters/show"
    end 

    get '/characters/:slug/edit' do
    #Shows the character name and the tropes associated
    end 

    patch '/characters/:slug/edit' do
    #Edits a characters tropes
    #Does NOT edit the novel a character is assigned to, just offers to delete the character
    end 
end 