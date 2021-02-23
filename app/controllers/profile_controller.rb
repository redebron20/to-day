class ProfileController < ApplicationController
    before ("/profile/*") do
        redirect_if_not_logged_in
    end

    get '/profile/:id' do
        if current_profile == Profile.find(params[:id])
            redirect '/profile'
        end
    end

    get '/profile/:id/edit' do
        erb :'profile/edit.html'
    end

    patch '/profile/:id' do
        if current_profile == Profile.find(params[:id])
            if current_profile.update(:name => params[:profile_name], :bio => params[:profile_bio])
                redirect "/profile/#{current_profile.id}"
            else
                redirect "/profile/edit"
            end
        end
    end

end