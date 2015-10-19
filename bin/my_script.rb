require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.html'
).to_s

url_show = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/5.json'
  ).to_s

url_key = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html?id=1'
    ).to_s

url_query1 = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.html'
).to_s

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(url, user: { name: "Greenland", email: "green@land.com"})
end

create_user
# puts RestClient.get(url)
# puts RestClient.get(url_show)
# puts RestClient.get(url_key)
# puts RestClient.post("#{url_query1}", id: 5)
# puts RestClient.post(url_show, id: 5)
