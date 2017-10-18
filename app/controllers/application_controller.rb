class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	rescue_from CanCan::AccessDenied do |exception|
	redirect_to main_app.root_url, :alert => exception.message
  end
  protected
  def after_sign_in_path_for(resource)
  	posts_url 	
  end

  protected
  def after_sign_out_path_for(resource)
  	root_url
  end
end
