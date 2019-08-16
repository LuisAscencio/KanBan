class MilestonesController < ApplicationController
    before_action :authentication_required


    def index
        @milestones = Milestone.all
    end

    def new
        @milestone = Milestone.new
    end

    def create
        @milestone = Milestone.create(milestone_params)
        if @milestone.valid?
            redirect_to milestones_path
        else
            flash[:errors] = @milestone.errors.full_messages
            redirect_to new_milestone_path
        end

    end

    def edit

    end

    def update
        @milestone = Milestone.find_by(current_user).update(completed_params)
        if @milestone.valid?
            redirect_to milestones_path
        else
            flash[:errors] = @milestone.errors.full_messages
            redirect_to new_milestone_path
        end
    end

   def show
       @milestone = Milestone.find(params[:id])
   end
   
    
    private

    def milestone_params
        params.require(:milestone).permit(:title, :category, :completed?, :due_date, :user_id)
    end

    def completed_params
        params.require(:completed?).permit(:completed?)
    end

    # def find_milestone
    #     @milestone = Milestone.find_by(current_user)
    # end

end
