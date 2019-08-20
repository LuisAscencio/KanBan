class MilestonesController < ApplicationController
    before_action :authentication_required


    def index
        @milestones = Milestone.all
        @user_milestones = current_user.milestones
    end

    def new
        @milestone = Milestone.new
    end

    def create
        @milestone = Milestone.create(milestone_params)
        if @milestone.valid?
            @task = Task.new
            redirect_to new_milestone_task_path(@milestone, @task)
        else
            flash[:errors] = @milestone.errors.full_messages
            redirect_to new_milestone_path
        end

    end
    
    def edit
        @milestone = Milestone.find(params[:id])
    end

def update
    @milestone = Milestone.find(params[:id])
    @milestone.update_attributes(milestone_params)
     if @milestone.valid?
     redirect_to milestone_path(@milestone.id)
     else
    flash[:errors] = @milestone.errors.full_messages 
     redirect_to edit_milestone_path
     end
end



  
    

    

   def show
       @milestone = Milestone.find(params[:id])
        @task = Task.new
   end

   def destroy
       @milestone = Milestone.find(params[:id])
       @milestone.destroy
        redirect_to milestones_path
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
