class EntitiesController < ApplicationController

    def index
        @group = Group.find(params[:group_id])
        @entities = @group.entities
        @entity_sum = Entity.calculate_sum
    end

    def show
        @entity = Entity.find(params[:id])
    end

    def new
        @entity = Entity.new
        @groups = Group.find(params[:group_id])
    end

    def create
        @entity = Entity.new(entity_params)
        @group = Group.find(params[:group_id])
        @entity.user = current_user

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
end