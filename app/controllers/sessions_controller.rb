class SessionsController < ApplicationController
    # GET: /sessions
    get '/login' do
        redirect '/tasks'
        erb :'sessions/login.html'
    end

    post '/login' do
        user = User.find_by(params[:user])
        if logged_in?
            flash[:success]="Account created!"
            redirect
        else
            flash[:error]= user.errors.full_messages.to_sentence
            redirect '/signup'
        end
         
    end

    get '/logout' do
        if session[:user_id] != nil
          session.clear
          redirect to '/sessions/login.html'
        else
          redirect to '/'
        end
      end
end