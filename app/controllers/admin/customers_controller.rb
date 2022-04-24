class Admin::CustomersController < ApplicationController

def index
    @customers = Customer.all
end

def show
    @customers = Customer.find(params[:id])
end

def edit
    @customer = Customer.find(params[:id])
end

def update
     @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to admin_root_path
end

def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_kana_name, :first_kana_name, :email, :postal_code, :telephone_number, :address)
end

end
