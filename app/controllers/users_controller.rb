class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup.html'
    end

    post '/signup' do
        user = User.create(params[:user])
        if user.valid?
            flash[:success] = "Account created!"
            session["user_id"] = user.id
            redirect '/tasks'
        else
            flash[:error] = user.errors.full_messages.to_sentence
            redirect '/signup'
        end
    end
end