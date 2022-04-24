class Public::CustomersController < ApplicationController
    def show
        @customers = current_admin
    end
    
    def edit
        @customer = current_customer
    end
    
    def update
        @customer = current_customer
        @customer.update(customer_params)
        redirect_to customers_path
    end
    
    def confirm
    end
    
    def destroy
        @customers = current_customer
        @customers.update(is_acactive: false)
        reset_session
        redirect_to root_path
    end
    
    private

def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :email, :postal_code, :telephone_number, :address, :is_acactive)
end
end
