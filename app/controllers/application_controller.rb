class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
       case resource
       when Admin
            admin_path
       when Customer
            root_path
       end
    end
    
  def after_sign_out_path_for(resource)
      case resource
       when :admin
             new_admin_session_path
       when :customer
            new_customer_session_path
      end
  end
    
 private
    
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_kana_name, :first_kana_name, :postal_code, :address, :telephone_number])
  end
  
end
