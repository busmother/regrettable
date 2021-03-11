class IncidentsController < ApplicationController
    before_action :authenticate_user!

    def show
        @incident = Incident.find_by(id: params[:id])
    end

    def new
        @incident = Incident.new
        @incident.apologies.build(:apology_type: 'your apology')
    end

end
