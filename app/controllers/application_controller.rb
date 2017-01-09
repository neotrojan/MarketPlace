class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Per indicare a devise le modifiche alle tabelle
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #Indicare la creazine della colonna name a devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #Indicare che l'untente può modificare la sua mail anche successivamente
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
