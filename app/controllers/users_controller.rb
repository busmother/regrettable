class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        binding.pry
    end

    def show
        @user = User.find_by(id: params[:id])
    end
end
