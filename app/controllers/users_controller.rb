class UsersController < ApplicationController

    get '/signup' do
        redirect_if_not_logged_in
        erb :'users/signup.html'
    end

    post '/signup' do
        user = User.create(params[:user])
        if user.valid?
            profile = Profile.new(name: user.username, bio: "Tell us about yourself")
            user.profile = profile
            flash[:success] = "Account created!"
            session["user_id"] = user.id
            redirect '/lists'
        else
            flash[:error] = user.errors.full_messages.to_sentence
            redirect '/signup'
        end
    end
end