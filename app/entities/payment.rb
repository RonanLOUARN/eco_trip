class Payment
  class << self
    def bill
      Rails.logger.info "Payment has been billed"
    end

    def pay
      Rails.logger.info "Payment has been paid"
    end

    def reimburse
      Rails.logger.info "Payment has been refunded"
    end
  end
end