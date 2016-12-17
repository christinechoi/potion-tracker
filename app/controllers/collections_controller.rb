class CollectionsController < ApplicationController 

  get '/collections' do 
    @collections = Collection.all

    erb :index
  end


  get '/collections/new' do 



    erb :'collections/new'
  end


  get '/collections/:id/edit' do 

  end


  get '/collections/:id' do 

  end


  post '/collections/:id' do 

  end

  post '/collections' do 
    @collection = Collection.create(name: params[:name])

  end



end
