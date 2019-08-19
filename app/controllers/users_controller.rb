class UsersController < ApplicationController
    before_action :authentication_required
    skip_before_action :authentication_required, :only => [:new, :create]

    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.valid? 
            redirect_to root_path
        else
            flash[:errors] = @user.errors.full_messages
            render 'users/new'
        end
    end

    def show
        @user = current_user
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password)
    end
    
end
