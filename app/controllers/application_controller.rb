require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get "/" do
    erb :"/index.html"
  end

  error Sinatra::NotFound do
    erb :"error.html"
  end

  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def current_profile
      @current_profile = current_user.profile 
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      redirect "/login" if !logged_in?
    end

    def redirect_if_logged_in
      redirect "/lists" if logged_in?
    end

  end

end
