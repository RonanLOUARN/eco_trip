class Trip < ApplicationRecord
  validates :state, presence: true
  validates :code, uniqueness: true, presence: true

  before_validation :set_code
  after_validation :trigger_event_publisher
  before_save :print_state
  before_save :trigger_payment

  enum state: {
    created: 'created',
    started: 'started',
    canceled: 'canceled'
  }

  private

  def trigger_event_publisher
    return unless state_changed? || !persisted?

    rabbit = Rabbit.new
    rabbit.publish("Trip n° #{id} has been #{state}")
    rabbit.destroy
  end

  def trigger_payment
    return unless state_changed? || !persisted?

    Payment.bill if created?
    Payment.pay if started?
    Payment.reimburse if canceled?
  end

  def print_state
    return unless state_changed?

    Rails.logger.info state
  end

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
