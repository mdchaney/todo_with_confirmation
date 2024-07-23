json.extract! todo_with_blob, :id, :body, :finished, :created_at, :updated_at
json.url todo_with_blob_url(todo_with_blob, format: :json)
