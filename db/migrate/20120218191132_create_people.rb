class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :major
      t.integer :gradYear

      t.timestamps
    end
  end
end
