class Admin::OrderDetailsController < ApplicationController
    
def update
end

private

def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :quantity, :production_status)
end
end
