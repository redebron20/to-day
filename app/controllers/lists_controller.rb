class ListsController < ApplicationController

    get '/lists/new' do
        redirect_if_not_logged_in
        erb :'lists/new.html'
    end

    post '/lists' do
        @user = current_user
        list = @user.lists.create(:name => params[:name])
        task = list.tasks.new(:name => params[:task][:name])
        task.save

        redirect '/tasks'
    end

    get '/lists/:id/edit' do
        redirect_if_not_logged_in
        @list = List.find(params[:id])
        @task = Task.find(params[:id])
        erb :'lists/edit.html'
    end

    patch '/lists/:id' do
    
        @list = List.find(params[:id])
        @list.update(:name => params[:name])

        if !params["task"]["name"].empty?
        @list.tasks << Task.create(params[:task])
        end

        redirect '/tasks'
    end

    get '/lists/:id/delete' do
        @list = List.find_by_id(params[:id])
        erb :'lists/delete.html'
    end
    
    delete '/lists/:id' do 
        @list = List.find_by_id(params[:id])
        @list.destroy
        redirect '/tasks'
    end

end