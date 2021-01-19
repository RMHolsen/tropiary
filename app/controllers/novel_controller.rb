class NovelController < ApplicationController

    get '/novels' do
    #Iterates over novels that belong to a current user and displays them.
    if logged_in?
        @user = current_user
        erb :"/novels/index"
    else 
        erb :"/sessions/new"
    end 
    end 

    get '/novels/new' do
    #Loads form to make a new novel attached to the logged in user
    if logged_in?
        @user = current_user
        erb :"/novels/new"
    else 
        erb :"/sessions/new"
    end 
    end

    post '/novels' do
    #Collect the data and build a new novel off the current user
    @user = current_user
    @novel = current_user.novels.build(title: params[:novel][:title], genre: params[:novel][:genre], word_count: params[:novel][:word_count], synopsis: params[:synopsis])
    #current_user.novels.build = @user.novels << Novel.create(attributes)
        if @novel.save 
            flash[:create] = "Novel successfully created."
            redirect to "/novels/#{@novel.slug}"
            #If you did it correctly you get a new novel page
        else 
            flash[:input_error] = "Build incomplete. Please try again."
            redirect to "/novels/new"
            #Otherwise you get to do it again
        end 
    end 

    get '/novels/:slug' do
    #Loads an individual novel page with its cast of characters.
    @user = current_user
    @novel = Novel.find_by_slug(params[:slug])
    @characters = @novel.characters
    erb :"/novels/show"
    end 

    get '/novels/:slug/edit' do
    #Load edit page for novels
    #Should be able to edit title, genre, wordcount, and synopsis simply
    #Edit characters or just delete characters on the character page? decisions.
    @novel = Novel.find_by_slug(params[:slug])
        if logged_in? && authorize(@novel)
            #Authorize method!
            erb :"/novels/edit"
        else 
            flash[:nedry] = "Ah-ah-ah! You didn't say the magic word!"
            redirect to "/novels/#{@novel.slug}"
        end 
    end 

    patch '/novels/:slug' do
    #Updates novel using user input 
    @novel = Novel.find_by_slug(params[:slug])
        if logged_in? && authorize(@novel)
            #AUTHORIZE METHOD
            @novel.update(title: params[:novel][:title], genre: params[:novel][:genre], word_count: params[:novel][:word_count], synopsis: params[:novel][:synopsis])
            flash[:update] = "Novel successfully updated."
            redirect to "/novels/#{@novel.slug}"
        else 
            flash[:nedry] = "Ah-ah-ah! You didn't say the magic word!"
            redirect to "/novels/#{@novel.slug}"
        end 
    end 

    delete '/novels/:slug' do
    @novel = Novel.find_by_slug(params[:slug])
    if logged_in? && authorize(@novel)
    #If you're logged in you can delete a novel
    @novel.destroy
    redirect to "/novels"
    else 
    #Otherwise Nedry mocks you some more
    flash[:nedry] = "Ah-ah-ah! You didn't say the magic word!"
    redirect to "/novels/#{@novel.slug}"
    end 
    end 

end 