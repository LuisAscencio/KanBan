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
    
    helper_method :current_user, :subtask_incomplete_count, :task_incomplete_count, :milestone_incomplete_count, :task_complete_count

end
