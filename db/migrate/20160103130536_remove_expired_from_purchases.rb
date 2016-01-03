class RemoveExpiredFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :expired, :boolean
  end
end
