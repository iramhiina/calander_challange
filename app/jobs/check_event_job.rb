class CheckEventJob
  include Sidekiq::Worker

  def perform
    Event.all.each do |event|
      if event.date <= Date.Today && event.notification == true
        # Generate a notification for the event
        send_notification(event.title)
      end
    end
  end

  private

  def send_notification(title)
    notification_message = "It's time for your event: #{title}"
  end
end
