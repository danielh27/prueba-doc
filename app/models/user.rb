class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :branches

  validates :name, presence: true
  validates :rfc, presence: true, uniqueness: true, format: { with: /\A\d{12,13}\z/ }
  validates :company_name, presence: true
end
