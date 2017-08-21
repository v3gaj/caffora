json.extract! post, :id, :title, :subtitle, :release_date, :cover, :author, :created_at, :updated_at
json.url post_url(post, format: :json)
