json.array! @benches do |bench|
  json.id bench.id
  json.description bench.description
  json.lat bench.lat
  json.lng bench.lng
end
