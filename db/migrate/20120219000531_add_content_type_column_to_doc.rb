class AddContentTypeColumnToDoc < ActiveRecord::Migration
  def up
    add_column :docs, :content_type, :string
  end

  def down
    remove_column :docs, :content
  end

end
