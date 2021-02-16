class SessionsController < ApplicationController
    # GET: /sessions
    get '/login' do
        redirect '/tasks' if logged_in?
        erb :'sessions/login.html'
    end

    post '/login' do
        user = User.find_by(params[:user])
        if logged_in?
            flash[:success]="Account created!"
            redirect '/tasks'
        else
            flash[:error]= user.errors.full_messages.to_sentence
            redirect '/signup'
        end
         
    end

    get '/logout' do
      session.clear
      redirect "/"
    end
end