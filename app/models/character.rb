class Character < ActiveRecord::Base

  def self.charactersHash
    Character.all.each_with_object({}) do |character, hash|
      name = character.name.split.map(&:capitalize).join(' ').split('-').map(&:titleize).join('-')
      hash[name] = {characterID: character.character_id, comics: character.comics, series: character.series, stories: character.stories, events: character.characterEventsArray, thumbnailPath: character.thumbnail_path, info: character.url}
    end
  end

  def self.sortedByValue(value)
    sortedData = charactersHash.sort_by { |name, data| data[value] }.reverse
    sortedData.each_with_object({}) do |(name, data), sortedHash|
      sortedHash[name] = {"value": data[value], "imageURL": "#{data[:thumbnailPath]}/standard_medium.jpg", "info": data[:info]}
    end
  end

  def self.allEvents
    charactersHash.each_with_object([]) do |character, array|
      array << character.last[:events]
    end
  end

  def self.commonEvents
    allEvents.inject(:&)
  end

  def self.chartData
    charactersHash.each_with_object({}) do |(name, data), chartHash|
      chartHash[name] = data[:series]
    end
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
