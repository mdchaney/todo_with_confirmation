class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :body, limit: 100, null: false
      t.boolean :finished, null: false, default: false

      t.timestamps
    end
  end
end
