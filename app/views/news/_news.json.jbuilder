json.extract! news, :id, :news_type, :details, :created_at, :updated_at
json.url news_url(news, format: :json)
