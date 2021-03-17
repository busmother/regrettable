class HomeController < ApplicationController
  def index
    @apologies = Apology.newest_apologies
  end
end
