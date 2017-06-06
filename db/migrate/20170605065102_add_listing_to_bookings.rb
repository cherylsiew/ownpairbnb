class AddListingToBookings < ActiveRecord::Migration[5.1]
  def change
  	add_reference :bookings, :listing
  end
end
