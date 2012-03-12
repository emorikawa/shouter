class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.belongs_to :user
      # t.integer :user_id # Equivalent to the line above.

      t.text :body

      t.timestamps
    end
    add_index :shouts, :user_id
  end
end
