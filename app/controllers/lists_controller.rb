class ListsController < ApplicationController
    before ("/lists/*") do
        redirect_if_not_logged_in
    end

    get '/lists' do
        @user = current_user
        @lists = @user.lists
        @profile = current_profile
        erb :'lists/show.html'
    end

    get '/lists/new' do
        redirect_if_not_logged_in
        erb :'lists/new.html'
    end

    post '/lists' do
        user = current_user
        list = user.lists.create(:name => params[:name])
        task = list.tasks.new(:name => params[:task][:name])
        task.save
        redirect '/lists'
    end

    #edit lists and add new task under list
    get '/lists/:id/edit' do
        redirect_if_not_logged_in
        @list = List.find(params[:id])
        erb :'lists/edit.html'
    end

    patch '/lists/:id' do
       
        list = List.find(params[:id])
        
        if current_user == list.user
            list.update(:name => params[:list][:name])

            if !params["task"]["name"].empty?
            list.tasks << Task.create(:name => params[:task][:name])
            end
        else
            flash[:error] = "Unauthorize to edit list."
        end
        redirect '/lists'
    end

    #adding new task under list
    get '/lists/:id/tasks/new' do
        @list = List.find_by_id(params[:id])
        erb :'/lists/new_task.html'
    end

    post '/lists/:id' do
        list = List.find_by_id(params[:id])
        Task.create(:name => params[task][:name], :list_id => params[:id])
        redirect '/lists'
    end

    #lists deletion
    get '/lists/:id/delete' do
        @list = List.find_by_id(params[:id])
        erb :'lists/delete.html'
    end
    
    delete '/lists/:id' do 
        list = List.find_by_id(params[:id])

        if current_user == list.user
            list.destroy
        else
            flash[:error] = "Unauthorize to delete list."
        end
        redirect '/lists'
    end

end