class TasksController < ApplicationController

    def index
        @tasks = Task.all
        @user_tasks = current_user.tasks
        completed
    end

    def new
        @task = Task.new
        @user_milestones = current_user.milestones
    end


    def create 
        @task = Task.create(task_params)
        if @task.valid?
            redirect_to tasks_path
        else
            flash[:errors] = @task.errors.full_messages
            redirect_to new_task_path
        end
    end


    def edit
     @task = Task.find(params[:id])
    end


    def update
         @task = Task.find(params[:id])
         @task.update_attributes(task_params)
          if @task.valid?
             redirect_to task_path(@task.id)
         else
            flash[:errors] = @task.errors.full_messages 
         redirect_to edit_task_path
      end
    end

    def show
        @task = Task.find(params[:id])
    end

    def completed
        @task = Task.all
        @task.each do |task|
            task.subtasks.each do |subtask|
            if subtask.completed? == true
                task.update(completed?: true)
            elsif subtask.completed? == false
                task.update(completed?: false)
                flash[:error] = "You have some subtasks to complete!"
            end
         end
      end
    end

    def destroy
       @task = Task.find(params[:id])
       @task.destroy
        redirect_to tasks_path
   end

    helper_method :completed
    
private

    def task_params
        params.require(:task).permit(:title, :priority, :due_date, :completed?, :milestone_id)
    end

end
