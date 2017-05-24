class ProductsController < ApplicationController 

  get '/products' do 
    redirect_if_not_logged_in

    @products = current_user.products
    erb :'/products/index'
  end

  get '/products/new' do 
    redirect_if_not_logged_in
    @collections = current_user.collections.all
    erb :'/products/new'
  end

  post '/products' do 
      # Todo: 
        # add validations to the product 
        # what happens if the validation fails?

    @product = Product.create(name: params[:product][:name], brand: params[:product][:brand], description: params[:product][:description], collection_ids: params[:product][:collection_ids])
    if @product.save 
      flash[:notice] = "Successfully added new product."
      redirect "products/#{@product.id}"
    else 
      flash[:notice] = "Sorry, try again."
      redirect to 'products/new'
    end
    
  end

  get '/products/:id' do 
    redirect_if_not_logged_in
    # Todo
      # What happens if the product exist?
    
    @product = Product.find_by_id(params[:id])

    if current_user.all_products.include?(@product)
      # binding.pry
      erb :"/products/show"
    else
      # binding.pry
      erb :'/products/index'
    end

    
  end

  get '/products/:id/edit' do 
    redirect_if_not_logged_in

    # Todo
      # What happens if the product exist?
    @product = Product.find(params[:id])

    if current_user.all_products.include?(@product)
      erb :"/products/edit"
    else
      # binding.pry
      flash[:notice] = "Sorry, product could not be found."
      redirect '/products'
    end

    
  end

  patch '/products/:id' do 
    # Todo:
      # make sure update works before notification and redirect 
    @product = Product.find(params[:id])
    # Todo:
      # update returns a true or false, make sure to handle that with a if else in case of failure
    if @product
      @product.update(name: params[:name], brand: params[:brand], description: params[:description])
      flash[:notice] = "Product successfully updated."
      binding.pry
      redirect "/products/#{@product.id}"
    else
      flash[:notice] = "Update not successful. Please try again."
      binding.pry
      redirect "/products/#{@product.id}"
    end
  end

  

  delete '/products/:id/delete' do #delete action
    @product = Product.find_by_id(params[:id])
    @product.delete
    flash[:notice] = "Product deleted."
    redirect to '/products'
  end
end
