class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :themes

  validates :name, presence: true
  validates :description, presence: true
  validates :description, length: {maximum: 500}

  def bargain?
    price < 30
  end

  def self.order_by_price
    order(:price)
  end

end
