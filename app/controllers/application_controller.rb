class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Per indicare a devise le modifiche alle tabelle
  before_action :configure_permitted_parameters, if: :devise_controller?

  #Per far si che devise salvi la location attuale 
  before_filter :store_location

  protected

  def configure_permitted_parameters
    #Indicare la creazine della colonna name a devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #Indicare che l'utente può modificare la sua mail anche successivamente
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  #Per far si che devise salvi la location attuale 
  def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath 
  end
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

end
