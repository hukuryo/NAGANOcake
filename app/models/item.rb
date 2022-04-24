class Item < ApplicationRecord
attachment :image
belongs_to :genre
has_many :cart_items
def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
end
def with_tax_price
    (price * 1.1).floor
end
end
