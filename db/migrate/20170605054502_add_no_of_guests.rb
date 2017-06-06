class AddNoOfGuests < ActiveRecord::Migration[5.1]
  def change
  	add_column :bookings, :no_of_adults, :integer
  	add_column :bookings, :no_of_children, :integer
  end
end
