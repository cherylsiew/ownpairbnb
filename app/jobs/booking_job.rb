class BookingJob < ApplicationJob
  queue_as :default
  # self.queue_adapter = :resque

  def perform(customer, host, booking_id)
    BookingMailer.booking_email(customer, host, booking_id).deliver_now
  end
end

