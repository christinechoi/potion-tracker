class CollectionsController < ApplicationController 

  get '/collections' do 
    #redirect_if_not_logged_in

    erb :'collections/index'
  end


  get '/collections/new' do 
    redirect_if_not_logged_in

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
    

    erb :'/collections/show'
  end



end
