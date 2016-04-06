class NotificationConsumer
  include Hutch::Consumer
  consume 'ng.notification.new'

  def process(payload)
    puts payload
  end
end
