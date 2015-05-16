json.array!(@pages) do |page|
  json.extract! page, :id, :url, :title, :description, :project_id
  json.url page_url(page, format: :json)
end
