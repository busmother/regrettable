class ApologiesController < ApplicationController
    before_action :authenticate_user!
    # def index

    # end

    def show
        @apology = Apology.find_by(id: params[:id])
    end

    def forgive
        @apology = Apology.all.find(params[:id])
        Forgiveness.create(user_id: current_user.id, apology_id: @apology.id)
        redirect_to apology_path(@apology)
    end

end


