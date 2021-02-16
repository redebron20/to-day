class ListsController < ApplicationController

    get '/lists/new' do
        redirect_if_not_logged_in
        erb :'/lists/new.html'
    end

    post '/lists' do
        @user = current_user
    
        if !params["list"]["name"].empty?
            list = @user.lists << List.create(params[:list])
        end

        if !params["task"]["name"].empty?
            list.tasks << Task.create(params[:task])
        end

        erb :'tasks/show.html'


    end
end