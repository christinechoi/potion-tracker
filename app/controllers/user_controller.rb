
class UsersController < ApplicationController 

  get '/signup' do 
    if !logged_in?
      erb :'/users/signup'
    else
      redirect '/'
    end
  end


  # get '/home' do
  #   @user = User.find(session[:id])
  #   erb :'/users/home'
  # end

  post '/signup' do
    user = User.new(:username => params[:username], :password => params[:password])
    if user.save
      redirect "/login"
    else
      redirect "/failure"
    end
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
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect :'/collections'
    else
      flash[:error] = "Your login information seems to be incorrect."
      redirect to '/login'
    end
  end

    #   post "/login" do
    #     user = User.find_by(:username => params[:username])
    #     if user && user.authenticate(params[:password])
    #         session[:user_id] = user.id
    #         redirect "/success"
    #     else
    #         redirect "/failure"
    #     end
    # end





  # get '/users/:id' do 
  #   #redirect_if_not_logged_in

  #   @user = User.find(params[:id])
    
  #   erb :'/users/show'
  # end




end