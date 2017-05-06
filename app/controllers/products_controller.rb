class ProductsController < ApplicationController 


  get '/products' do 
    erb :'/products/index'
  end

  get '/products/new' do 
    #redirect_if_not_logged_in
    @collections = Collection.all 
    erb :'/products/new'
  end

  post '/products' do 
    # binding.pry
    # flash.now[:notice] = "Successfully created new product." 
    if params[:product][:name] == "" || params[:product][:brand] == "" 
      flash[:notice] = "Name and Brand fields required." #this didn't show 
    
      redirect :'/products/new' 
    else
      @product = Product.create(name: params[:name], brand: params[:brand], description: params[:description])
      @product = Product.create(params[:product])

    end
    flash[:notice] = "Successfully added new product."
    redirect "products/#{@product.id}"
  end

  get '/products/:id' do 
    @product = Product.find(params[:id])

    erb :'/products/show'
  end

  get '/products/:id/edit' do 
    @product = Product.find(params[:id])
    

    erb :'/products/edit'
  end

  post '/products/:id' do 
    flash[:notice] = "Successfully updated product." 
    @product = Product.find(params[:id])
    @product.update(name: params[:name], brand: params[:brand], description: params[:description])

    erb :'/products/show'
  end


end