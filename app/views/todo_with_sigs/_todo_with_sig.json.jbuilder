json.extract! todo_with_sig, :id, :body, :finished, :created_at, :updated_at
json.url todo_with_sig_url(todo_with_sig, format: :json)
