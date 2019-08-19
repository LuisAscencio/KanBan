class TasksController < ApplicationController

    def index
        @tasks = Task.all
        @user_tasks = current_user.tasks 
    
    end

    def new
        @task = Task.new
        @user_milestones = current_user.milestones
    end


    def create 
        @task = Task.create(task_params)
        if @task.valid?&& Task.all.count<3
            redirect_to tasks_path
        else
            flash[:errors] = @task.errors.full_messages
            redirect_to new_task_path
        end

    end
    
private

    def task_params
        params.require(:task).permit(:title, :priority, :due_date, :completed?, :milestone_id)
    end

end
