class IncidentsController < ApplicationController
    before_action :authenticate_user!

    def show
        @incident = Incident.find_by(id: params[:id])
    end
end
