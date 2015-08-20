json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :start_date, :estimeted_end_date, :users_id
  json.url project_url(project, format: :json)
end
