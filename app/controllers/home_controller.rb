class HomeController < ApplicationController
  
  def index
      @apologies = Apology.newest_apologies
      @longest_apologies = Apology.long_apology
      @users = User.all
      @incidents = Incident.all
  end

end
