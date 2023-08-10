class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups.display_groups
  end

  def new
    @group = current_user.groups.build
  end

  def show; end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new, status: 422
    end
  end

  private

  def group_params
    params.require(:group).permit(:user_id, :name, :icon)
  end
end
