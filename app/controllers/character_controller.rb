class CharacterController < ApplicationController
    #There is no get /characters/ do because characters derive from novels

    get '/novels/:novel_slug/characters' do
    #Displays the list of characters in each novel
    #Originally this had an authorize method but then I decided I didn't care about the viewing abilities
    @novel = Novel.find_by_slug(params[:novel_slug])
    @characters = @novel.characters.all 
    erb :"/characters/index"
    end 

    get '/novels/:novel_slug/characters/new' do
    #Loads form to create a new character for a specific novel
    @novel = Novel.find_by_slug(params[:novel_slug])
    @tropes = Trope.all
        if logged_in? && authorize(@novel)
            #If authorized, pull up a new character form
            erb :"/characters/new"
        else 
            #Otherwise redirect to the novel character index
            #When I am a grown-up dev I will have to make this something normal like flash[:error]
            #But for now it's flash[:nedry] dammit.
            flash[:nedry] = "Ah-ah-ah! You didn't say the magic word!"
            redirect to "/novels/#{@novel.slug}/characters"
        end 
    end 

    post '/novels/:novel_slug/characters' do 
    @novel = Novel.find_by_slug(params[:novel_slug])
        #Again, this is where the authorize method should go, silly.
        if logged_in? && authorize(@novel) 
            #Creates a new character for a specific novel based on parameters
            #Renders the character page for the character
            @character = Character.create(name: params[:name], descrip: params[:descrip])
            @character.novel = @novel 
            @tropes = params[:trope_ids]
                @tropes.each do |t|
                    @character.tropes << Trope.find(t)
                end 
            @character.save 
            flash[:create] = "New character created."
            redirect to "/novels/#{@novel.slug}/characters/#{@character.slug}"
        else 
            flash[:nedry] = "Ah-ah-ah! You didn't say the magic word!"
            redirect to "/novels/#{@novel.slug}/characters"
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
    #Edit form for the character
    @novel = Novel.find_by_slug(params[:novel_slug])
    @character = Character.find_by_slug(params[:slug])
    @tropes = Trope.all
        if logged_in? && authorize(@novel)
            #If user is logged in and authorized, edit form
            erb :"/characters/edit"
        else
            flash[:nedry] = "Ah-ah-ah! You didn't say the magic word!"
            redirect to "/novels/#{@novel.slug}/characters/#{@character.slug}"
        end 
    end 

    patch '/novels/:novel_slug/characters/:slug' do
    #Updates character and their tropes.
    @novel = Novel.find_by_slug(params[:novel_slug])
    @character = Character.find_by_slug(params[:slug])
        if logged_in? && authorize(@novel)
            #Does NOT edit the novel the character is assigned to. If you want to do that you have to delete and re-enter.
            #Maybe additional functionality for a future version
            @character.update(name: params[:name], descrip: params[:descrip])
            @character.tropes.clear
            #This may not be the best way to do this but it's the simplest that I can think of right now?
            @tropes = params[:trope_ids]
            @tropes.each do |t|
                @character.tropes << Trope.find(t)
            end 
            @character.save 
            flash[:update] = "Character successfully updated."
            redirect to "/novels/#{@novel.slug}/characters/#{@character.slug}"
        else 
            #Hm. Do I actually need the flash message in post and patch?
            flash[:nedry] = "Ah-ah-ah! You didn't say the magic word!"
            redirect to "/novels/#{@novel.slug}/characters/#{@character.slug}"
        end 
    end 

    delete '/novels/:novel_slug/characters/:slug' do
        #Deletes the character
        #Not sure how best to do this flash message
        @novel = Novel.find_by_slug(params[:novel_slug])
        @character = Character.find_by_slug(params[:slug])
        if logged_in? && authorize(@novel)
        @character.destroy
        redirect to "/novels/#{@novel.slug}/characters"
        else 
        flash[:nedry] = "Ah-ah-ah! You didn't say the magic word!"
        redirect to "/novels/#{@novel.slug}/characters"
        end 
    end 
end 