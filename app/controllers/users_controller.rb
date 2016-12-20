
class UsersController < ApplicationController 

  get '/signup' do 
    erb :'/users/signup'
  end


  post '/signup' do 
    
    if params[:username] == "" || params[:password] == ""
      redirect to :"/signup"
    else
      @user = User.create(username: params[:username], password: params[:password])
      session[:id] = @user.id
      redirect to :"/collections"
    end
  end


  get '/login' do 
    erb :'/users/login'
  end


  post '/login' do 
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    session[:id] = @user.id
    redirect :'/user/:id'


  end

  get '/users/:id' do 
    #redirect_if_not_logged_in

    @user = User.find(params[:id])
    raise "error"
    erb :'/users/show'
  end




end