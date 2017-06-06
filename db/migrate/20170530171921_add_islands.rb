class AddIslands < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :islands, :string
  end
end
