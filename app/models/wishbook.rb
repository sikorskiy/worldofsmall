class Wishbook < ApplicationRecord
  belongs_to :user
  belongs_to :book



  before_save :default_value
  #validates :quantity, presence: true, numericality: {greater_than: 0}

  def default_value
    self.quantity ||= 1
  end

end
