class RemoveStates < ActiveRecord::Migration[5.1]
  def change
  	remove_column :listings, :state, :string
  end
end
