class Branch < ApplicationRecord
  belongs_to :user
  has_many :branch_employees

  validates :name, presence: true
  validates :street_name, presence: true
  validates :neighborhood_name, presence: true
  validates :outdoor_number, numericality: { only_integer: true }
  validates :indoor_number, numericality: { only_integer: true }
  validates :postal_code, presence: true, format: { with: /\A\d{5}\z/ }
  validates :country, presence: true
  validates :city, presence: true
end
