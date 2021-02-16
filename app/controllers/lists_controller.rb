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

        erb :'list/edit.html'
    end

end