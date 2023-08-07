class UsersController < ApplicationController
    before_action :authenticate_user!

    has_many :groups
    has_many :entities

    def index
        @users = User.all
    end
end