class ApologiesController < ApplicationController
    before_action :authenticate_user!

    def show
        @apology = Apology.find_by(id: params[:id])
        @apology_user = @apology.user
    end

    def forgive
        @apology = Apology.all.find(params[:id])
        Forgiveness.create(user_id: current_user.id, apology_id: @apology.id)
        redirect_to apology_path(@apology)
    end

end


