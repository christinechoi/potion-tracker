
class UsersController < ApplicationController 

  # get '/signup' do 
  #   erb :'/users/signup'
  # end


  get '/users/home' do
    @user = User.find(session[:id])
    erb :'/users/home'
  end


  # post '/signup' do 
    
  #   # if params[:username] == "" || params[:password] == ""
  #   #   redirect to :"/signup"
  #   # else
  #     @user = User.create(username: params[:username], password: params[:password])
  #     session[:id] = @user.id
  #     redirect :"/collections"
  #   # end
  # end


  get '/login' do 
    erb :'/users/login'
  end


  post '/login' do 
    if user && user.authenticate(params[:password])
      session[:id] = @user.id
      redirect :'/collections'
    else
      redirect to '/signup'
    end
  end

  get '/users/:id' do 
    #redirect_if_not_logged_in

    @user = User.find(params[:id])
    
    erb :'/users/show'
  end




end