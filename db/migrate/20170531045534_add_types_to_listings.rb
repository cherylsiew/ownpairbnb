class AddTypesToListings < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :Property_Name, :text
  	add_column :listings, :Property_Type, :text
  end
end
