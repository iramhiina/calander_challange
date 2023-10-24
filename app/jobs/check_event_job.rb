class CheckEventJob
  include Sidekiq::Worker

  def perform
  	debugger
    Event.all.each do |event|
      if event.date <= Date.Today && event.notification == true
        # Generate a notification for the event
        send_notification(event.title)
      end
    end
  end

  private

  def send_notification(title)
     javascript_code = "alert('It\'s time for your event: #{title}');"

    ActionView::Base.full_sanitizer.sanitize(javascript_code)  
   end
end
