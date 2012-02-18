class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.integer :course_id
      t.date :datetime
      t.integer :type_id
      t.integer :semester_id
      t.integer :owner_id
      t.string :prof
      t.binary :data
      t.string :title

      t.timestamps
    end
  end
end
