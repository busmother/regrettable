class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        #@user = User.find_by(id: params[:id]) #this won't raise error
        @user = User.find(params[:id]) #this will
    end

end
