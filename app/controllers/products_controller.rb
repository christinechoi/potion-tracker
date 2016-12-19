class ProductsController < ApplicationController 


  get '/products' do 

    erb :'/products/index'
  end

  get '/products/new' do 
    #redirect_if_not_logged_in
    erb :'/products/new'
  end

  post '/products' do 
    @product = Product.create(name: params[:name], brand: params[:brand], description: params[:description])

    redirect :'/products/:id' 
  end

  get '/products/:id' do 
    @product = Product.find_by(id: params[:id])

    erb :'/products/show'
  end

  get '/products/:id/edit' do 
    @product = Product.find(params[:id])

    erb :'/products/edit'
  end


end