# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(email: "k@c.om", password: "ok" )
bandiguess = Band.create!(name: "band I guess")
umok = bandiguess.albums.create!(title: "um ok")
hi = umok.tracks.create!(title: "hi")

