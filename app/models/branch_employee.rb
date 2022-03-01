class BranchEmployee < ApplicationRecord
  belongs_to :branch

  validates :name, presence: true
  validates :rfc, presence: true, format: { with: /\A\d{12,13}\z/ }
  validates :role, presence: true
end
