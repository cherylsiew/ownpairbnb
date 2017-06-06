class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
    	t.references :user
    	t.date :start_date
    	t.date :end_date
    	t.integer :no_of_days

        t.timestamps
    end
  end
end
