class IncidentsController < ApplicationController
    before_action :authenticate_user!

    def show
        @incident = Incident.find_by(id: params[:id])
    end

    def new
        @incident = Incident.new
        @incident.apologies.build
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
