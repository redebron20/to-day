class TasksController < ApplicationController
    before ("/tasks/*") do
        redirect_if_not_logged_in
    end

    # Builds new task associated with the LIST ID
    get '/tasks/new' do
        @user = current_user
        @lists = List.all
        erb :'tasks/new.html'
    end

    post '/tasks' do
        task = Task.create(:name => params[:name], :list_id => params[:list_id])

        if task.valid?
            flash[:success] = "Task created!"
            redirect '/lists'
        else
            flash[:error] = task.errors.full_messages.to_sentence
            redirect '/tasks/new'
        end
    end
      
    # task editing
    get '/tasks/:id/edit' do
        @task = Task.find(params[:id])
        @lists = List.all
        erb :'/tasks/edit.html'
    end

    patch '/tasks/:id' do
        task = Task.find(params[:id])
        if current_user == task.list.user
            task.update(:name => params[:task][:name], :list_id => params[:list_id])
        else
            flash[:error] = "Unauthorize to edit task."
        end
        redirect '/lists'
    end

    get '/tasks/:id/delete' do
        @task = Task.find_by_id(params[:id])
        erb :'tasks/delete.html'
    end

    delete '/tasks/:id' do 
        task = Task.find(params[:id])
        if current_user == task.list.user
            task.destroy
        else
            flash[:error] = "Unauthorize to delete task."
        end
        redirect '/lists'
      end

end