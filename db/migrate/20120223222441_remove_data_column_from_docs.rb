class RemoveDataColumnFromDocs < ActiveRecord::Migration
  def up
     remove_column :docs, :data
  end

  def down
     add_column :docs, :data, :binary
  end
end
