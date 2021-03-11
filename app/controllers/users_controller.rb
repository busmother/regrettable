class UsersController < ApplicationController
    # before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

    def show
        # byebug
        # if current_user == nil && user_signed_in? == false
        #     render 'new_user_session_path'
        # #@user = User.find_by(id: params[:id]) #this won't raise error
        # else
            @user = User.find(params[:id]) #this will
        #  end
    end

end
