class AddSmokers < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :smoking?, :boolean
  end
end
