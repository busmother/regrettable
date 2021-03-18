class ApologiesController < ApplicationController
    # before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    helper ApologiesHelper

    def show
        @apology = Apology.find(params[:id])
        @apology_user = @apology.user
    end

    # def new #old new
    #     @incidents = Incident.all
    #     @incident = Incident.new
    #     # @incident.apologies.build
    #     @apology = Apology.new
    # end

    def new #new new
        @incidents = Incident.all
        @incident = Incident.new #we need this otherwise the new incident field doesn't exist
        @apology = Apology.new
    end

    # def create 
    #     @apology = Apology.new(user_id: current_user.id, incident_id: params[:apology][:incident_id], body: params[:apology][:body])
    #     # byebug
    #     @incident = Incident.find_or_create_by(name: params[:apology][:incident_attributes][:name])
    #     @apology.incident = @incident
    #     byebug
    #     # if @incident == nil
    #     #     @incident = Incident.find_by(incident_id: params[:apology][:incident_id])

    #     if @apology.valid?
    #         @apology.save
    #         redirect_to incident_path(@incident)
    #     else
    #         flash.now[:messages] = @apology.errors.full_messages
    #         @incidents = Incident.all
    #         render :new
    #     end
    # # end
    # end

    def create #new create
        if params[:apology][:incident_id].to_i > 0 #if you use the dropdown there will be an incident_id >0; if not, it will be "", which is 0
            @incident = Incident.find(params[:apology][:incident_id]) # so we find the incident
        else
            @incident = Incident.find_or_create_by(name: params[:apology][:incident_attributes][:name])#this works if you use the form
        end
        @apology = Apology.new(user_id: current_user.id, incident_id: @incident.id, body: params[:apology][:body])
        if @apology.valid?
            @apology.save
            redirect_to incident_path(@incident)
        else
            flash.now[:messages] = @apology.errors.full_messages
            @incidents = Incident.all
            render :new
        end
    end

    def edit
        @apology = current_user.apologies.find(params[:id])
        @incident = @apology.incident
    end

    def update
        @apology = Apology.all.find(params[:id])
        @apology.update(body: params[:apology][:body])
        redirect_to apology_path(@apology)
    end

    def destroy
        @apology = current_user.apologies.find(params[:id])
        @incident = @apology.incident
        @apology.destroy
        # byebug
        redirect_to incident_path(@incident)
    end

    def forgive
        @apology = Apology.all.find(params[:id])
        @incident = @apology.incident
        if @apology.forgiven?(current_user)
            @apology.forgivenesses.find{|forgiveness| forgiveness.user_id == current_user.id}.destroy
        else
            Forgiveness.create(user_id: current_user.id, apology_id: @apology.id)
        end
        redirect_to incident_path(@incident)
    end

    def unforgive
        forgive
    end

    private

    # def apology_params
    #     params.require(:apology).permit(:body, :incident_attributes: [:name])
    # end
end


