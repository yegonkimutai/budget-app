class EntitiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_group

    def index
        @group = Group.includes(:entities).find(params[:group_id])
        @entities = @group.entities.show_trans
    end

    def new
        @group = Group.find(params[:group_id])
        @entity = @group.entities.build
    end

    def create
        @group = Group.find(params[:group_id])
        @entity = @group.entities.build(entity_params)
        @entity.user = current_user

        Rails.logger.info @record.inspect

        if @entity.save
            redirect_to group_entities_url(@group), notice: 'Transaction successful.'
          else
            render :new
          end
    end

    private

    def entity_params
        params.require(:entity).permit(:name, :amount)
    end

    def set_group
        @group = current_user.groups.find(params[:group_id])
    end
end