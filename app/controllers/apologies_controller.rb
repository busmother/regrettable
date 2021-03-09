class ApologiesController < ApplicationController
    before_action :authenticate_user!
    # def index

    # end

    def show
        @apology = Apology.find_by(id: params[:id])
    end
end


