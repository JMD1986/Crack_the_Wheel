json.array!(@wheels) do |wheel|
  json.extract! wheel, :id, :like
  json.url wheel_url(wheel, format: :json)
end
