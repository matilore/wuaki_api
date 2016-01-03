class CreateTwoDays < ActiveRecord::Migration
  def change
    create_table :two_days do |t|

      t.timestamps null: false
    end
  end
end
