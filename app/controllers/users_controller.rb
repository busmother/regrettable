class UsersController < ApplicationController
    # before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

    def show
        # #@user = User.find_by(id: params[:id]) #this won't raise error
        if current_user == nil
            #redirect to sign up
        end
            @user = User.find(params[:id])
            @apologies = @user.apologies
    end

end
