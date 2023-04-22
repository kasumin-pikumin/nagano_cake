class Order < ApplicationRecord
  belongs_to :customer

  has_many :order_details


  def order_amount
    @amount = 0
    self.order_details.each do |detail|
      @amount += detail.amount
    end
    return @amount
  end

  enum payment_method: { credit_card: 0, transfer: 1 }
end
