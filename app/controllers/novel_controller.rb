class NovelController < ApplicationController

    get '/novels' do
        @novels = Novel.all
        erb :"/novels/index"
    end 

    get '/novels/new' do
    @characters = Character.all
    #Make a new novel
    end

    post '/novels' do
    @novel = Novel.create(title: params[:novel][:title], genre: params[:novel][:genre], wordcount: params[:novel][:wordcount])
    #Collet the new novel data and make the new novel object w/genre and wordcount attributes
    redirect to "/novels/#{@novel.slug}"
    #redirect to the novel page
    end 

    get '/novels/:slug' do
    @novel = Novel.find_by_slug(params[:slug])
    #Title, genre, wordcount
    #Eventually you could go wild and make a summary!
    @characters = Character.all 
    #Characters in the novel
    erb :"/novels/show"
    end 

    get '/novels/:slug/edit' do
    @novel = Novel.find_by_slug(params[:slug])
    #Should be able to edit title, genre, wordcount simply
    #Should be able to edit characters more complexily?
    #Yes complexily is a word
    end 

    patch '/novels/:slug' do 
    #Finishes the edit, i.e. rewriting the data to the novel object
    #Redirect to the novel page at the end
    end 


end 