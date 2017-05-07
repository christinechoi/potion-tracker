
class UsersController < ApplicationController 
  use Rack::Flash

  get '/signup' do 
    if !logged_in?
      erb :'/users/signup'
    else
      redirect '/'
    end
  end

  get '/users/show' do
    @user = User.find(session[:id])
    erb :'/users/show'
  end

  post '/signup' do
    user = User.new(:username => params[:username], :password => params[:password])
    if user.save
      redirect "/login"
    else
      redirect "/failure"
    end
  end

  get '/login' do 
    erb :'/users/login'
  end


  post '/login' do 

    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      flash.now[:notice] = "Successfully created new user."
      redirect '/users/show'
    else
      flash[:error] = "Your login information seems to be incorrect."
      redirect to '/login'
    end
  end

  get '/signout' do
    session.clear
    flash[:notice] = "Successfully signed out."
    redirect '/login'
  end




  # get '/users/:id' do 
  #   #redirect_if_not_logged_in

  #   @user = User.find(params[:id])
    
  #   erb :'/users/show'
  # end




end