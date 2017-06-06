class AddSmoking < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :smoking?, :string
  end
end
