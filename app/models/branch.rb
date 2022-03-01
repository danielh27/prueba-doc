class Branch < ApplicationRecord
  belongs_to :user
  has_many :branch_employees
end
