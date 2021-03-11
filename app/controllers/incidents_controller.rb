class IncidentsController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

    def show
        @incident = Incident.find(params[:id])
    end

    def new
        @incident = Incident.new
        @incident.apologies.build
    end

    def create
        @incident = Incident.create!(incident_params)
        @apology = @incident.apologies.last
        @apology.user = current_user
        @apology.save
        redirect_to incident_path(@incident)
    end

    private

    def incident_params
        params.require(:incident).permit(
            :name,
            apologies_attributes: [
                :body
            ]
        )
    end
end
