class TasksController < ApplicationController
  
    get '/tasks' do
        redirect_if_not_logged_in
        @user = current_user
        @lists = @user.lists
        erb :'tasks/show.html'
    end

    get '/tasks/new' do
        redirect_if_not_logged_in
        @user = current_user
        @lists = List.all
        erb :'tasks/new.html'
    end

    post '/tasks/new' do
        Task.create(:name => params[:name], :list_id => params[:list_id])
        redirect '/tasks'
    end

    
end