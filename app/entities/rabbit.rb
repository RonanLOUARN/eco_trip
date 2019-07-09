class Rabbit
  def initialize
    @connection = Bunny.new(host: 'rabbitmq', user: 'guest', pass: 'guest').tap(&:start)
    @channel = @connection.create_channel
  end

  def publish(message = "Nothing to publish")
    dispatch = @channel.fanout("rabbit")
    dispatch.publish(message)
  end

  def destroy
    @connection.close
  end
end