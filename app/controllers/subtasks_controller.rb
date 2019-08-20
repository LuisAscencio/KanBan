class SubtasksController < ApplicationController

    def index
        @subtasks = Subtask.all
        @user_subtasks = current_user.subtasks
    end

    def new
        @subtask = Subtask.new
        @user_tasks = current_user.tasks
    end


    def create
        @subtask = Subtask.create(subtask_params)
        if @subtask.valid?
            redirect_to subtasks_path
        else
            flash[:errors] = @subtask.errors.full_messages
            redirect_to new_subtask_path
        end
    end 

    def show
        @subtask = Subtask.find(params[:id])

    end

    private

    def subtask_params
        params.require(:subtask).permit(:title, :completed?, :task_id)  
    end
    


end
