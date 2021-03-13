class ForgivenessesController < ApplicationController
    before_action :authenticate_user!

    def new
        @forgiveness = Forgiveness.new
    end

end
