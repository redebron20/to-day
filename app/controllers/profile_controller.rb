class ProfileController < ApplicationController

    get '/profile' do
        redirect_if_not_logged_in
        redirect '/profile'
    end

    get '/profile/:id' do
        redirect '/profile'
    end

    get '/profile/:id/edit' do
        erb :'profile/edit.html'
    end

    patch '/profile/:id' do
        profile = current_profile
    
        if profile.update(:name => params[:profile_name], :bio => params[:profile_bio])
            redirect "/profile/#{profile.id}"
        else
            redirect "/profile/edit"
        end
    end

end