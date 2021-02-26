class SessionsController < ApplicationController
    # GET: /sessions
    get '/login' do
        redirect_if_logged_in
        erb :'sessions/login.html'
    end

    post '/login' do
        user = User.find_by(:username => params["user"]["username"])
        if user && user.authenticate(params["user"]["password"])
          session["user_id"] = user.id
          flash[:success] = "Successfully logged in!"
          redirect "/lists"
        else
          flash[:error] = "Invalid credentials. Please try again."
          redirect "/login"
        end
    end

    get '/logout' do
      session.clear
      redirect "/"
    end
end