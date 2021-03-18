class ApologiesController < ApplicationController
    # before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    helper ApologiesHelper

    def show
        @apology = Apology.find(params[:id])
        @apology_user = @apology.user
    end

    def new
        @incidents = Incident.all
        @incident = Incident.new
        # @incident.apologies.build
        @apology = Apology.new
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

    def create 
        @apology = Apology.new(user_id: current_user.id, incident_id: params[:apology][:incident_id], body: params[:apology][:body])
        @incident = @apology.incident
        if @apology.valid?
            @apology.save
            redirect_to incident_path(@incident)
        else
            flash.now[:messages] = @apology.errors.full_messages[0]
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
end


