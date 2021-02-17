class TasksController < ApplicationController
  
    get '/tasks' do
        redirect_if_not_logged_in
        @user = current_user
        @lists = @user.lists
        erb :'tasks/show.html'
    end

    # Builds new task associated with the LIST ID
    get '/tasks/new' do
        redirect_if_not_logged_in
        @user = current_user
        @lists = List.all
        erb :'tasks/new.html'
    end

    post '/tasks' do
        Task.create(:name => params[:name], :list_id => params[:list_id])
        redirect '/tasks'
    end

    # task editing
    get '/tasks/:id/edit' do
        @task = Task.find(params[:id])
        erb :'/tasks/edit.html'
    end

    patch '/tasks/:id' do
        @task = Task.find(params[:id])
        @task.update(:name => params[:name])
        redirect '/tasks'
    end

    delete '/tasks/:id' do 
        @task = Task.find(params[:id])
        @task.destroy
        redirect '/tasks'
      end

end