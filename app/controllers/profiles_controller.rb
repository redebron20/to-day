class ProfilesController < ApplicationController
    before ("/profiles/*") do
        redirect_if_not_logged_in
    end

    get '/profiles/:id' do
        if current_profile == Profile.find(params[:id])
            erb :'profiles/profile.html'
        end
    end

    get '/profiles/:id/edit' do
        erb :'profiles/edit.html'
    end

    patch '/profiles/:id' do
        if current_profile == Profile.find(params[:id])
            if current_profile.update(:name => params[:profile_name], :bio => params[:profile_bio])
                redirect "/profiles/#{current_profile.id}"
            else
                redirect "/profiles/edit"
            end
        end
    end

end