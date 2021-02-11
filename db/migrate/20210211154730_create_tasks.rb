class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :list, foreign_key: {on_delete: :cascade}
      t.timestamps null: false
    end
  end
end
