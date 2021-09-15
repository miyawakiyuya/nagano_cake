class OrderDetail < ApplicationRecord

   enum making_status: { production_impossible: 0, production_wait: 1, production: 2, produced: 3 }
   belongs_to :item
   belongs_to :order

   validates :item_id, presence: true
   validates :order_id, presence: true
   validates :price, presence: true
   validates :amount, presence: true
   validates :making_status, presence: true
end
