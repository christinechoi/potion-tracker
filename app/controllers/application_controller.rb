require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "sluglife"
    enable :sessions
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do

  end

  post '/registrations' do

  end

  get '/sessions/login' do

  end

  post '/sessions' do

  end

  get '/sessions/logout' do

  end

  get '/users/home'  do

  end



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