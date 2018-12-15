class RegistrationsController < Devise::RegistrationsController
	before_action :configure_permitted_parameters, if: :devise_controller?

 	def create
    @secret_code = SecretCode.find_or_create_by(code: sign_up_params[:secret_code])
	  build_resource(sign_up_params)
	  resource_saved = resource.save
	  yield resource if block_given?
	  if resource_saved
	  	@secret_code.update(user_id: resource.id)
	    if resource.active_for_authentication?
	      set_flash_message :notice, :signed_up if is_flashing_format?
	      sign_up(resource_name, resource)
	      respond_with resource, location: after_sign_up_path_for(resource)
	    else
	      set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
	      expire_data_after_sign_in!
	      respond_with resource, location: after_inactive_sign_up_path_for(resource)
	    end
	  else
	    clean_up_passwords resource
	    @validatable = devise_mapping.validatable?
	    if @validatable
	      @minimum_password_length = resource_class.password_length.min
	    end
	    respond_with resource
	  end
	end


protected

  def configure_permitted_parameters
  # 	# devise_parameter_sanitizer.require(:sign_up).permit!(:first, :last, :email, :password, :password_confirmation, :secret_code)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first, :last, :email, :password, :password_confirmation, :secret_code])
  end
end
