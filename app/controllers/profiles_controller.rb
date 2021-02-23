class ProfilesController < ApplicationController
    configure do 
        set :views, 'app/views'
    end

    get '/profile' do
        redirect_if_not_logged_in
        erb :'profile/show'
    end

    
end