class Trip < ApplicationRecord
  validates :state, presence: true
  validates :code, uniqueness: true, presence: true
end
