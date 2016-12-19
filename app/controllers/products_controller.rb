class ProductsController < ApplicationController 


  get '/products' do 
    erb :'/products/index'
  end

  get '/products/new' do 
    #redirect_if_not_logged_in
    erb :'/products/new'
  end

  post '/products' do 
    
    if params[:name] == "" || params[:brand] == "" 
      redirect :'/products/new' 
    else
      @product = Product.create(name: params[:name], brand: params[:brand], description: params[:description])
      # add to collection if one is checked
      # if none is checked, there must be new collection
        #add product to new collection

      # collection should be one belonging to current_user
      
      # 
      # @user = User.find(session[:id])
      # @user.collection
    end

    redirect :'/products' 
  end

  get '/products/:id' do 
    @product = Product.find(params[:id])

    erb :'/products/show'
  end

  get '/products/:id/edit' do 
    @product = Product.find(params[:id])

    erb :'/products/edit'
  end


end