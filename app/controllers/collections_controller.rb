class CollectionsController < ApplicationController 

  get '/collections' do 
    redirect_if_not_logged_in
    @collections = Collection.all 

    erb :'collections/index'
  end


  get '/collections/new' do 
    redirect_if_not_logged_in

    erb :'collections/new'
  end


  get '/collections/:id/edit' do 
    redirect_if_not_logged_in
    @collection = Collection.find(params[:id])
    #fields should have previous info filled in 

     erb :'/collections/edit'
  end


  get '/collections/:id' do 
    redirect_if_not_logged_in
    
    @collection = Collection.find(params[:id])

    erb :'/collections/show'
  end


  post '/collections' do 
    @collection = Collection.create(name: params[:name])

    erb :'/collections/show'
  end



end
