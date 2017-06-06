class AddPaymentDetailsToBookings < ActiveRecord::Migration[5.1]
  def change
  	add_column :bookings, :transaction_id, :string
  	add_column :bookings, :transaction_status, :string
  	add_column :bookings, :fourdigits, :string
  end
end
