class Admin::OrdersController < ApplicationController
  
  def show
    @orders = Order.find(params[:id])
  end
  
  
  private
  
    def order_params
        params.require(:order).permit(:customer_id, :address, :postal_code, :name, :payment_method, :postage, :order_status, :total_payment, :addresses, :address_id)
    end
end
