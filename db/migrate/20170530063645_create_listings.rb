class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.references :user
    	t.string :address1
    	t.string :address2
    	t.string :city
    	t.string :postcode
    	t.string :state
    	t.string :country
    	t.string :currency
    	t.integer :no_of_rooms
    	t.integer :no_of_beds
    	t.integer :no_of_bathrooms
    	t.integer :price_per_day
    	t.integer :price_per_week
    	t.integer :price_per_calendar_month

    	t.timestamps
    end
  end
end
