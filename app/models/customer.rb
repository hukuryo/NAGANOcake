class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :cart_items
         has_many :orders
         has_many :addresses
         
  def prepare_cart
    cart || create_cart
  end
  
  def prepare_purchase_record
    purchase_record || create_purchase_record
  end
  
  def checkout
    purchase_record = prepare_purchase_record
    ids = product_ids.map{ |id| { product_id: id } }
    purchase_record.purchase_record_products.create!(ids)
  end
  
end
