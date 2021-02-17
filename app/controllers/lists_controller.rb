class ListsController < ApplicationController

    get '/lists/new' do
        redirect_if_not_logged_in
        erb :'lists/new.html'
    end

    post '/lists' do
        @user = current_user
    
        if !params["list"]["name"].empty?
            list = @user.lists.create(params[:list])
            if list.valid?
                flash[:success] = "Successfully created list!"
                redirect "/tasks"
            else
                flash[:error] = list.errors.full_messages.join(", ")
                redirect "/list/new"
            end
        end

        if !params["task"]["name"].empty?
            task = list.tasks.create(params[:task])
        end

        erb :'tasks/show.html'  
    end

    get '/lists/:id/edit' do
        redirect_if_not_logged_in
        @list = List.find(params[:id])
        erb :'lists/edit.html'
    end

    patch '/lists/:id' do
        @list = List.find(params[:id])
        @list.update(params["list"])

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