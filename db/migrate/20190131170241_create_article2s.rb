class CreateArticle2s < ActiveRecord::Migration[5.2]
  def change
    create_table :article2s do |t|

      t.timestamps
    end
  end
end
