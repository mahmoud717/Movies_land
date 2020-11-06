class AddColumnsToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :article_id, :integer
    add_column :tags, :category_id, :integer
  end
end
