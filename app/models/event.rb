class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :themes

  validates :name, presence: true
  validates :description, presence: true
  validates :description, length: {maximum: 500}
end
