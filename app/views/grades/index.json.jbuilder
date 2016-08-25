json.array!(@grades) do |grade|
  json.extract! grade, :id, :track_id, :finished, :finished_at
  json.url grade_url(grade, format: :json)
end
