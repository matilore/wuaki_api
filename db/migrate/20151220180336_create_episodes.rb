class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
    	t.belongs_to :season, index:true
    	t.string :title
      	t.text :plot

      t.timestamps null: false
    end
  end
end
