class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        #@user = User.find_by(id: params[:id])
        @user = User.find(params[:id])
    end


    #create a way to throw an error if it doesn't find a user

end
