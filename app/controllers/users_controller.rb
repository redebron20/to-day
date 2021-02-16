class UsersController < ApplicationController
    # GET: /users/new

    get '/signup' do
        erb :'users/signup.html'
    end


    post '/signup' do
       
        #show user profile with to do list and tasks
        user = User.create(params[:user])
        if user.valid?
            flash[:success]="Account created!"
            session[:user_id]=user.id
            redirect "/users/#{user.id}"
        else
            flash[:error]= user.errors.full_messages.to_sentence
            redirect '/signup'
        end
    end


    get '/users/:id' do
        @user = Users.find_by(params[:id])
        erb :show
    end



end