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
    end
    

    helper_method :current_user

end
