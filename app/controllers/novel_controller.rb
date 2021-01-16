class NovelController < ApplicationController

    get '/novels' do
        @user = current_user
        #@novels = Novel.all
        erb :"/novels/index"
    end 

    get '/novels/new' do
    @user = current_user
    #Make a new novel
    erb :"/novels/new"
    end

    post '/novels' do
    @user = current_user
    @novel = current_user.novels.build(title: params[:novel][:title], genre: params[:novel][:genre], word_count: params[:novel][:word_count], synopsis: params[:synopsis])
    #@user.novels << @novel ------ code for Novel.create 
    #Collect the data and build a new novel off the current user
        if @novel.save 
            redirect to "/novels/#{@novel.slug}"
            #If you did it correctly you get a new novel page
        else 
            redirect to "/novels/new"
            #Otherwise you get to do it again
        end 
    end 

    get '/novels/:slug' do
    @user = current_user
    @novel = Novel.find_by_slug(params[:slug])
    #Title, genre, wordcount
    #Eventually you could go wild and make a summary!
    @characters = @novel.characters
    #Characters in the novel
    erb :"/novels/show"
    end 

    get '/novels/:slug/edit' do
    @novel = Novel.find_by_slug(params[:slug])
        if current_user.id == @novel.user_id 
            erb :"/novels/edit"
        else 
            erb :"/novels/show"
        end 
    #Should be able to edit title, genre, wordcount simply
    #Should be able to edit characters more complexily?
    #Yes complexily is a word
    end 

    patch '/novels/:slug' do 
    @novel = Novel.find_by_slug(params[:slug])
        if current_user.id == @novel.user_id
            @novel.update(title: params[:novel][:title], genre: params[:novel][:genre], word_count: params[:novel][:word_count], synopsis: params[:novel][:synopsis])
            erb :"/novels/show"
        else 
        #flash message goes here
            erb :"/"
        end 
    #Finishes the edit, i.e. rewriting the data to the novel object
    #Redirect to the novel page at the end
    end 

    delete '/novels/:slug' do
    @novel = Novel.find_by_slug(params[:slug])
    @novel.destroy
    redirect to "/novels"
    end 

end 