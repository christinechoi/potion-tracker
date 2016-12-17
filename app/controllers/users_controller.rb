


class UsersController < ApplicationController 



  get '/signup' do 

    erb :'/users/signup'
  end


  post '/signup' do 
    redirect :'/signup' if params[:username] == "" || params[:password] == ""
    
    @user = User.create(username: params[:username], password: params[:password])
    #session[:id] = @user.id

    redirect :'/collections/new'
  end


  get '/login' do 
    erb :'/users/login'
  end


  post '/login' do 
    @user = User.find_by(username: params[:username] ).try(:authenticate, params[:password])
    session[:id] = @user.id
    redirect :'/collections'
  end

  get '/users/:slug' do 

    erb :'/users/show'
  end




end