class Character < ActiveRecord::Base

  def self.charactersHash
    characters = {}
    Character.all.each do |character|
      name = character.name.split.map(&:capitalize).join(' ').split('-').map(&:titleize).join('-')
      characters[name] = {characterID: character.character_id, comics: character.comics, series: character.series, stories: character.stories, events: character.characterEventsArray, thumbnailPath: character.thumbnail_path, info: character.url }
    end
    characters
  end

  def self.sortedByValue(value)
    sortedHash = {}
    sortedData = charactersHash.sort_by { |name, data| data[value] }.reverse
    sortedData.each do |name, data|
      sortedHash[name] = {}
      sortedHash[name]["value"] = data[value]
      sortedHash[name]["imageURL"] = "#{data[:thumbnailPath]}/standard_medium.jpg"
      sortedHash[name]["info"] = data[:info]
    end
    sortedHash
  end

  def self.allEvents
    allEventsArray = []
    charactersHash.each do |character|
      allEventsArray << character.last[:events]
    end
    allEventsArray
  end

  def self.commonEvents
    allEvents.inject(:&)
  end

  def self.chartData
    chartHash = {}
    charactersHash.each do |name, data|
      chartHash[name] = data[:series]
    end
    chartHash
  end

  def getCharacterEvents
    client = Adapters::MarvelApiConnection.new
    client.eventsQuery(self.name)["data"]["results"]
  end

  def characterEventsArray
    events = self.getCharacterEvents
    events.map do |event|
      event["title"]
    end
  end

  def imageUrl(character)
    "#{character.thumbnail_path}/standard_small.jpg"
  end

end
