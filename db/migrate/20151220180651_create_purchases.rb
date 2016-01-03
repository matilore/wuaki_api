class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
    	t.boolean :expired, :default=> false
      	t.integer :purchasable_id
      	t.string :purchasable_type

      t.timestamps null: false
    end
     add_index :purchases, [:purchasable_id, :purchasable_type]
  end
end
