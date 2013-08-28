json.array!(@posts) do |post|
  json.extract! post, :title, :date, :body
  json.url post_url(post, format: :json)
end
