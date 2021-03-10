class ForgivenessesController < ApplicationController
    before_action :authenticate_user!

    def new
        @forgiveness = Forgiveness.new
    end

    def create
        
    end
end
