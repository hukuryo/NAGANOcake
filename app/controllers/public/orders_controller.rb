class Public::OrdersController < ApplicationController
    
def index
    @orders = current_customer.orders
end

def new
    @order = Order.new
end

def confirm
    @cart_items = CartItem.all
    @order = Order.new(customer_id: params[:order] [:customer_id], payment_method: params[:order] [:payment_method], postage: params[:order] [:postage], order_status: params[:order] [:order_status])
    # 15,16,17では注文を進める上で変わらないものを定義している
    @order.payment_method = params[:order][:payment_method]
    @order.postage = 800
    @order.order_status = "入金待ち"
    if params[:order] [:addresses] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order] [:addresses] == "1"
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
        @order.address = Address.find(params[:order][:address_id]).address
        @order.name = Address.find(params[:order][:address_id]).name
    elsif params[:order] [:addresses] == "2"
        @order.postal_code = params[:order][:postal_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
    end
end

def create
    @order = Order.new(order_params)
    @order.save
    current_customer.cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.price = cart_item.item.price
        order_detail.quantity = cart_item.amount
        order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
end

def thanks
end

def show
    @order = Order.find(params[:id])
    #whereはひもずいているもののすべての情報を取ってくる。
    @order_details = OrderDetail.where(order_id: @order.id)
end

private

def order_params
    params.require(:order).permit(:customer_id, :address, :postal_code, :name, :payment_method, :postage, :order_status, :total_payment, :addresses, :address_id)
end

end
