class CollectionsController < ApplicationController 

  get '/collections' do 
    redirect_if_not_logged_in
    @collections = current_user.collections

    erb :'collections/index'
  end

  get '/collections/new' do 
    redirect_if_not_logged_in

    erb :'collections/new'
  end

  get '/collections/:id/edit' do 
    redirect_if_not_logged_in
    @collection = Collection.find_by(id: params[:id])
    if @collection && @collection.user == current_user
      erb :'/collections/edit'
    else 
      flash[:notice] = "You are a horrible person"
      redirect_to "/collections"
    end
  end


  get '/collections/:id' do 
    redirect_if_not_logged_in
    
    @collection = Collection.find_by(id: params[:id])
    @products = @collection.products if @collection 

    erb :'/collections/show'
  end


  post '/collections' do 
    redirect_if_not_logged_in
    @collection = current_user.collections.create(name: params[:name])
    
    if @collection.save 
      flash[:notice] = "Successfully added new collection."
      redirect "/collections/show"
    else
      flash[:notice] = "Collection must have a name."
      erb :"/collections/new" 
    end

  end

end
