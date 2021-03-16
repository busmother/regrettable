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

    # def create #original method
    #     # binding.pry
    #     @incident = Incident.create!(incident_params)
    #     @apology = @incident.apologies.last
    #     redirect_to apology_path(@apology)
    # end

    def create #updated method with flash
        # binding.pry
        @incidents = Incident.all
        @incident = Incident.new(incident_params)
        if @incident.valid?
            @incident.save
            @apology = @incident.apologies.last
            redirect_to apology_path(@apology)
        else
            flash.now[:messages] = @incident.errors.full_messages[0]
            # byebug
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
