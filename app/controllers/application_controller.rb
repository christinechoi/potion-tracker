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
      redirect :'/signup' if !session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    # Todo: 
      # if I call logged_in? and current_user in the same view, controller, etc.. I am making multiple database calls for the same object.
      # Look up memoization and the ||= operator for the current_user function. 
      # is instantiate a instance variable that holds the value of the object

    def current_user

      current_user ||= User.find_by(id: session[:user_id]) 
      #if session[:user_id]
    end

  end


end