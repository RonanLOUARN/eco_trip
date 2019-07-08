class Trip < ApplicationRecord
  validates :state, presence: true
  validates :code, uniqueness: true, presence: true

  enum state: {
    created: 'created',
    started: 'started',
    canceled: 'canceled'
  }
end
