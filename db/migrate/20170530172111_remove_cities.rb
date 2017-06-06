class RemoveCities < ActiveRecord::Migration[5.1]
  def change
  	remove_column :listings, :city, :string
  end
end
