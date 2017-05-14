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