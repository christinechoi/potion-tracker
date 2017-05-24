
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
    redirect_if_not_logged_in
    erb :'/users/show'
  end

  post '/signup' do
    user = User.new(:username => params[:username], :password => params[:password])
    if user.save
      flash[:notice] = "Successfully created new user."
      redirect "/login"
    else
      flash[:notice] = user.errors.full_messages
      redirect "/signup"
    end
  end

  get '/login' do 
    erb :'/users/login'
  end


  post '/login' do 

    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully created new user."
      redirect '/users/show'
    else
      flash[:notice] = "Error logging in - please try again."
      redirect to "/login"
    end
  end

  get '/signout' do
    session.clear
    flash[:notice] = "Successfully signed out." 
    redirect '/login'
  end

end