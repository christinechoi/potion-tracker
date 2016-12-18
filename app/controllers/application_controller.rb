require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  enable :sessions


  helpers do
    def redirect_if_not_logged_in
      redirect :'/login' if !session[:id]
    end

    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end


end