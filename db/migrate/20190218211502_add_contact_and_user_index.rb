class AddContactAndUserIndex < ActiveRecord::Migration[5.2]
  def change
  	add_column :profiles, :contact, :text
  end
end
