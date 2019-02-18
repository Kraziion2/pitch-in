class UserProfile < ActiveRecord::Migration[5.2]
  def change
  	create_table :profiles do |t|
    	t.string :name
    	t.string :surname
    	t.text :education
    	t.text :experience
    	t.text :knowledge
    	t.text :availability
    	t.integer :user_id 
    	t.timestamps
  	end
	end
end
