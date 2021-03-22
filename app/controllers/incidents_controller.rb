class IncidentsController < ApplicationController
    before_action :authenticate_user!

    def show
        @incident = Incident.find(params[:id])
        @apologies = @incident.apologies
        @apology = Apology.new
    end

    def new #unnecessary now?
        @incidents = Incident.all
        @incident = Incident.new
        @incident.apologies.build
        @apology = Apology.new
    end 

    def create #also unnecessary?
        # byebug
        @incidents = Incident.all
        @incident = Incident.new(incident_params)
        # byebug
        @incident.apologies.last.user_id = current_user.id
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

    def incident_params #if we can't include 
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
