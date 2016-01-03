class AddTypeToPurchase < ActiveRecord::Migration
  def change
  	add_column :purchases, :type, :string
  end
end
