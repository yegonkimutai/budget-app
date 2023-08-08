class ItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_group

    def index
        @items = Group.find(@group.id).items.order(created_at: :desc)
    end

    def new
        @group = Group.find(params[:group_id])
        @item = @group.items.build
    end

    def create
        @group = Group.find(params[:group_id])
        @items = @group.items.build(item_params)
        @items.author = current_user

        Rails.logger.info @item.inspect

        if @items.save
            redirect_to group_items_path(@group), notice: 'Transaction successful.'
          else
            render :new
          end
    end

    private

    def item_params
        params.require(:item).permit(:name, :amount)
    end

    def set_group
        @group = current_user.groups.find(params[:group_id])
    end
end