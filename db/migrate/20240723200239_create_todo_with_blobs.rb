class CreateTodoWithBlobs < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_with_blobs do |t|
      t.string :body, limit: 100, null: false
      t.boolean :finished, null: false, default: false

      t.timestamps
    end
  end
end
