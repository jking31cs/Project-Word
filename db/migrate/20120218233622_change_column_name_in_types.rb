class ChangeColumnNameInTypes < ActiveRecord::Migration
  def up
     rename_column :types, :type, :doc_type
  end

  def down
  end
end
