# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bench.create!(description: "a lovely red bench on the street", lat: 37.762234, lng: -122.450863)

Bench.create!(description: "a find blue bench", lat: 37.762599, lng:-122.452526)

Bench.create!(description: "an uncomfortable bench", lat: 37.761072, lng: -122.449575)

Bench.create!(description: "a grey bench, sheltered from the rain", lat: 37.762684, lng:-122.447333)
