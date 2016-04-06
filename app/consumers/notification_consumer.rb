class NotificationConsumer
  include Hutch::Consumer
  consume 'bs.notification.new'

  def process(payload)
    puts payload[:profile_ref_id]
  end
end
