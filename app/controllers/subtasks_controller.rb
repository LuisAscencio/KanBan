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

    def edit
        @subtask = Subtask.find(params[:id])
    end

    def update
        @subtask = Subtask.find(params[:id])
        @subtask.update_attributes(subtask_params)
         if @subtask.valid?
         redirect_to subtask_path
         else
        flash[:errors] = @subtask.errors.full_messages 
         redirect_to edit_subtask_path
         end
    end


    def complete
        @subtask = Task.find(params[:task_id]).subtasks.find(params[:subtask_id])
        @subtask = Subtask.find(params[:subtask_id])
        @subtask.update(completed?: true)
        redirect_to task_subtasks_path(@subtask.task_id)
        
    end


    def show
        @subtask = Subtask.find(params[:id])

    end

    private

    def subtask_params
        params.require(:subtask).permit(:title, :completed?, :task_id)  
    end
    


end
