class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404

    def render_404
      render :template => "errors/error_404", :status => 404
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
