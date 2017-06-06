class RemoveSmokers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :listings, :smoking?, :boolean
  end
end
