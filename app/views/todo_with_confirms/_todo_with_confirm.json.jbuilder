json.extract! todo_with_confirm, :id, :body, :finished, :created_at, :updated_at
json.url todo_with_confirm_url(todo_with_confirm, format: :json)
