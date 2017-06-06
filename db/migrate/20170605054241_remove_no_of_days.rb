class RemoveNoOfDays < ActiveRecord::Migration[5.1]
  def change
  	remove_column :bookings, :no_of_days, :integer
  end
end
