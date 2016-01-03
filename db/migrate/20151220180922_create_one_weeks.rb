class CreateOneWeeks < ActiveRecord::Migration
  def change
    create_table :one_weeks do |t|

      t.timestamps null: false
    end
  end
end
