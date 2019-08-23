class ApplicationController < ActionController::Base
    before_action :authentication_required, only: [:index]

    def authentication_required
        if !logged_in?
            redirect_to '/login'
        end
    end

    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def index
        @milestones = Milestone.all
        @user_tasks = current_user.tasks
        milestone_completed
    end

    def outstanding_items
        subtask_incomplete_count + task_incomplete_count + milestone_incomplete_count
    end

    def subtask_incomplete_count
       current_user.subtasks.where(completed?: false).count
    end

     def task_incomplete_count
       current_user.tasks.where(completed?: false).count
    end

    def task_complete_count
       current_user.tasks.where(completed?: true).count
    end

     def milestone_incomplete_count
       current_user.milestones.where(completed?: false).count
    end

    def milestone_completed
        @milestones = current_user.milestones
        @milestones.each do |milestone|
            if milestone.tasks.all?(completed?: true)
                milestone.update(completed?: true)
            else
                flash[:error] = "You have some subtasks to complete!"
            end
         end
    end


    
    helper_method :current_user, :subtask_incomplete_count, :task_incomplete_count, :milestone_incomplete_count, :task_complete_count, :outstanding_items, :milestone_completed

end
