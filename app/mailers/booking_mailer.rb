class BookingMailer < ApplicationMailer
  def booking_email(customer, host, booking_id)
    @customer = customer
    @host = host
    @booking_id = booking_id
    @url ='localhost:3000'
    mail(to: 'cheryl.siew.next@gmail.com', subject: "Your place has been booked")
  end
end
