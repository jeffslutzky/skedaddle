# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

namesArray = ["iron man", "spider-man", "thor", "captain america", "hulk"]

namesArray.each do |name|

  client = Adapters::MarvelApiConnection.new
  result = client.query(name)
  characterData = result["data"]["results"].first

  characterID = client.characterID(name)
  comics = characterData["comics"]["available"]
  series = characterData["series"]["available"]
  stories = characterData["stories"]["available"]
  thumbnailPath = characterData["thumbnail"]["path"]
  url = characterData["urls"][1]["url"]

  Character.create({name: name, character_id: characterID, comics: comics, series: series, stories: stories, thumbnail_path: thumbnailPath, url: url})

end
