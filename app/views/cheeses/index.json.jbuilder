json.array!(@cheeses) do |cheese|
  json.extract! cheese, :id, :name, :family, :style, :origin
  json.url cheese_url(cheese, format: :json)
end
