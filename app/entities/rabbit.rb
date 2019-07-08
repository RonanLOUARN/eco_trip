class Rabbit
  class << self
    def publish(message = "Nothing to publish")
      dispatch = channel.fanout("rabbit")
      dispatch.publish(message)
    end

    def channel
      connection.create_channel
    end

    def connection
      Bunny.new.tap(&:start)
    end
  end
end