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
    #I honestly don't know why I'm leaving this in here but I am. 

    get '/novels/:novel_slug/characters' do
    #Displays the list of characters in each novel
    @novel = Novel.find_by_slug(params[:novel_slug])
    #Do I really care if other users can READ who's in what novel or ... decisions.
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
        if current_user.id == @novel.user_id 
            erb :"/characters/new"
        else 
            erb :"/characters/index"
        end 
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
            redirect to "/novels/#{@novel.slug}/characters/#{@character.slug}"
        else 
            redirect to "/novels/#{@novel.slug}/characters"
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

    get '/novels/:novel_slug/characters/:slug/edit' do
    @novel = Novel.find_by_slug(params[:novel_slug])
    @character = Character.find_by_slug(params[:slug])
    @tropes = Trope.all
        if current_user.id == @novel.user_id 
            #Shows the character name and the tropes associated
            erb :"/characters/edit"
        else
            #No editing other people's characters you bad person 
            redirect to "/novels/#{@novel.slug}/characters/#{@character.slug}"
        end 
    end 

    patch '/novels/:novel_slug/characters/:slug' do
    @novel = Novel.find_by_slug(params[:novel_slug])
    @character = Character.find_by_slug(params[:slug])
        if current_user.id == @novel.user_id
            #Edits a characters tropes
            #Does NOT edit the novel a character is assigned to, just offers to delete the character
            @character.update(name: params[:name])
            @character.tropes.clear
            #This may not be the best way to do this but it's the simplest that I can think of right now?
            @tropes = params[:trope_ids]
            @tropes.each do |t|
                @character.tropes << Trope.find(t)
            end 
            @character.save 
            redirect to "/novels/#{@novel.slug}/characters/#{@character.slug}"
        else 
            #Flash message
            redirect to "/novels/#{@novel.slug}/characters/#{@character.slug}"
        end 
    end 

    delete '/novels/:novel_slug/characters/:slug' do
        @novel = Novel.find_by_slug(params[:novel_slug])
        @character = Character.find_by_slug(params[:slug])
        @character.destroy
        redirect to "/novels/#{@novel.slug}/characters"
    end 
end 