class SessionsController < ApplicationController
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
         
    end

    get '/logout' do
        
    end
end