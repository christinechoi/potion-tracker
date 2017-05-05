require './config/environment'
require 'pry'

require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "sluglife"
    enable :sessions
    use Rack::Flash
  end

  get "/" do
    erb :home
  end



  # get "/signup" do
  #   erb :'users/signup'
  # end

  # post "/signup" do
  #   @user = User.new(:username => params[:username], :password => params[:password])

  #   if @user.save
  #     redirect '/success'
  #   else 
  #     redirect '/failure'
  #   end

  # end

  # get "/login" do
  #   erb :login
  # end

  # post "/login" do
  #   @user = User.find_by(:username => params[:username])

  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect '/success'
  #   else
  #     redirect '/failure'
  #   end
  # end

  # get "/success" do
  #   if logged_in?
  #     erb :success
  #   else
  #     redirect "/login"
  #   end
  # end

  # get "/failure" do
  #   erb :failure
  # end

  # get "/logout" do
  #   session.clear
  #   redirect "/"
  # end
    



  helpers do
    def redirect_if_not_logged_in
      redirect :'/signup' if !session[:id]
    end

    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end

  end


end