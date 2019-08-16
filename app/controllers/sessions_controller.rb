class SessionsController < ApplicationController

    def new
    end

    # def create
    #     @user = User.find_by(:username => params[:username])
    #     session[:user_id] = @user[:id]
    #     redirect_to root_path
    # end

    def create
        @user = User.find_by(:username => params[:username])
        if @user
        session[:user_id] = @user[:id]
            redirect_to root_path
        else
            redirect_to login_path
        end
    end

    def destroy
        reset_session
        redirect_to login_path
    end
    
    

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
