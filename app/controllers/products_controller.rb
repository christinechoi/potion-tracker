class ProductsController < ApplicationController 





  get '/products' do 

    erb :'/products/new'
  end

  post '/products' do 
    @product = Product.create(params)

    redirect :'/products/:id' 
  end

  get '/products/:id' do 
    

  end


end