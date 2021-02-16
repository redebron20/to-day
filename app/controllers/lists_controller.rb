class ListsController < ApplicationController

    get '/lists/new' do
        redirect_if_not_logged_in
        erb :'/lists/new.html'
    end

    post '/lists' do
        @user = current_user
        list = @user.lists.create(params[:list])
        task = list.tasks.create(params[:tasks])

        erb :'tasks/show.html'
    end
end