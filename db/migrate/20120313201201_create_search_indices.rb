class CreateSearchIndices < ActiveRecord::Migration
  def change
    create_table :search_indices do |t|
      t.belongs_to :shout
      t.text :data

      t.timestamps
    end
    add_index :search_indices, :shout_id
  end
end
