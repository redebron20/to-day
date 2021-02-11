class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :user, foreign_key: {on_delete: :cascade}
      t.timestamps null: false
    end
  end
end
