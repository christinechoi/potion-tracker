class UsersController < ApplicationController 



  get '/users/signup' do 
    erb :'/users/signup'
  end


  post '/users/signup' do 

    @user = User.create(params)
    session[:id] = user.id

    redirect :'/collections'
  end


  get '/users/login' do 
    erb :'/users/login'
  end


  post '/users/login' do 


  end

  get '/users/:slug' do 

    erb :'/users/show'
  end




end