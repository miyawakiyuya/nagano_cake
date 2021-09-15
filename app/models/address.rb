class Address < ApplicationRecord
  belongs_to :customer


  def personal_information
    self.postal_code + self.address + self.name
  end

  validates :customer_id, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end
