class DropArticle2s < ActiveRecord::Migration[5.2]
  def change
  	drop_table :article2s
  end
end
