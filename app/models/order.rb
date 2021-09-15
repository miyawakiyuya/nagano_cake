class Order < ApplicationRecord
 enum status: { payment_waiting: 0, payment_confirmation: 1, production: 2, preparation: 3, sent: 4 }
 enum payment_method: { credit_card: 0, transfer: 1 }
 belongs_to :customer
 has_many :order_details, dependent: :destroy

 def personal_information
    self.postal_code + self.address + self.name
 end

 validates :customer_id, presence: true
 validates :postal_code, presence: true
 validates :address, presence: true
 validates :name, presence: true
 validates :postage, presence: true
 validates :total_payment, presence: true
 validates :payment_method, presence: true
 validates :status, presence: true



end
