json.extract! content, :id, :index, :style, :title, :body, :image, :video, :created_at, :updated_at
json.url content_url(content, format: :json)
