class GroupsController < ApplicationController
    before_action :authenticate_user!

    def index
        @groups = Group.display_groups
    end

    def new
        @group = Group.new
    end

    def show
        @group = Group.find_by_id(params[:id])
    end
    
    def create
        @group = Group.create(group_params)
        @group.user_id = current_user.id
    
        if @group.save
          redirect_to groups_path
        else
          render :new, status: 422
        end
    end

    private

    def group_params
        params.require(:group).permit(:id, :name, :icon)
    end
end