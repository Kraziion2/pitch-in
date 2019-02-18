class RecreateCategories < ActiveRecord::Migration[5.2]
  def change
  	#drop_table :categories
  	create_table :categories do |t|
 		t.string :name
 		t.timestamps
 	end
  end
end
