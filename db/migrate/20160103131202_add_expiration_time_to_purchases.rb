class AddExpirationTimeToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :expiration_time, :datetime
  end
end
