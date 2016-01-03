class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
    	t.belongs_to :serie, index:true

      t.timestamps null: false
    end
  end
end
