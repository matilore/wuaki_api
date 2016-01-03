class AddHdToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :hd, :boolean, :default => false
  end
end
