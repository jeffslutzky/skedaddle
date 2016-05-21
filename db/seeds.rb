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

  character_id = client.characterID(name)
  comics = characterData["comics"]["available"]
  series = characterData["series"]["available"]
  stories = characterData["stories"]["available"]

  Character.create({name: name, character_id: character_id, comics: comics, series: series, stories: stories})

  # eventsArray = []
  # events = client.eventsQuery(name)["data"]["results"]
  # events.each do |event|
  #   eventsArray << event["title"]
  # end
  #
  # Character.create({ name: name, character_id: character_id, comics: comics, series: series, stories: stories, events: eventsArray })


end
