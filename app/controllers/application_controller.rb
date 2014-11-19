class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #This is important shit
  before_action do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :ap_paterno, :ap_materno, :jurisdiction_id  ]
  end

  rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Acceso denegado."
  redirect_to root_url
end

end
