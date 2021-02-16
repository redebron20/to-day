class TasksController < ApplicationController
    before("/tasks") do
        redirect_if_not_logged_in if request.path_info != "/login"
    end
    
    get "/tasks" do
        redirect_if_not_logged_in
        @user = current_user
        @lists = @user.lists
        erb :'tasks/show.html'
    end

    

    # get '/users/:id' do
    #     @user = User.find_by(params[:id])
    #     erb :'tasks/show.html'
    # end

    
end