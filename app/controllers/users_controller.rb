class UsersController < ApplicationController
    # GET: /users/new

    get '/signup' do
        erb :'users/signup'
    end

    get '/login' do
        erb :'users/login'
    end

    post '/signup' do
        #user profile with to do list and tasks
    end

    post '/login' do
        #user profile with to do list and tasks
    end

    get ''

end