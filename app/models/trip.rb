class Trip < ApplicationRecord
  validates :state, presence: true
  validates :code, uniqueness: true, presence: true

  before_validation :set_code

  enum state: {
    created: 'created',
    started: 'started',
    canceled: 'canceled'
  }

  private

  def set_code
    return if persisted?

    self.code = generate_code
  end

  def generate_code
    loop do
      new_code = SecureRandom.base58(4)
      break new_code unless Trip.find_by(code: new_code)
    end
  end
end
