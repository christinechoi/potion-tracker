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

     erb :'/collections/edit'
  end


  get '/collections/:id' do 
    redirect_if_not_logged_in
    
    @collection = Collection.find(params[:id])
    @products = @collection.products

    erb :'/collections/show'
  end


  post '/collections' do 
    @collection = Collection.create(name: params[:name])
    flash.now[:notice] = "Successfully created new collection."
    erb :'/collections/show'
  end



end
