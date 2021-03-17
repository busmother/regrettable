class IncidentsController < ApplicationController
    # before_action :authenticate_user!, only: [:edit, :update, :destroy]

    def show
        @incident = Incident.find(params[:id])
        @apologies = @incident.apologies
        @apology = Apology.new
    end

    def new
        @incidents = Incident.all
        @incident = Incident.new
        @incident.apologies.build
    end 

    def create #updated method with flash
        @incidents = Incident.all
        @incident = Incident.new(incident_params)
        if @incident.valid?
            @incident.save
            @apology = @incident.apologies.last
            redirect_to incident_path(@incident)
        else
            flash.now[:messages] = @incident.errors.full_messages[0]
            render :new
        end
    end

    private

    def incident_params
        params.require(:incident).permit(
            :name,
            apologies_attributes: [
                :body,
                :user_id,
                :incident_id
            ]
        )
    end
end
