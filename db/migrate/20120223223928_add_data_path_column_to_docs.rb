class AddDataPathColumnToDocs < ActiveRecord::Migration
  def up
    add_column :docs, :data_path, :string   
  end
  def down
    remove_column :docs, :data_path
  end
end
