class Character < ActiveRecord::Base

  def self.charactersHash
    characters = {}
    Character.all.each do |character|

      characters[character.name] = {character_id: character.character_id, comics: character.comics, series: character.series, stories: character.stories, events: character.characterEventsArray }

      # characters[character.name] = {character_id: character.character_id, comics: character.comics, series: character.series, stories: character.stories, events: character.eventsArray }

    end
    characters
  end

  def self.sortByValue(value)
    sortedHash = {}
    sortedData = charactersHash.sort_by { |name, data| data[value] }.reverse
    sortedData.each do |name, data|
      sortedHash[name] = data[value]
    end
    sortedHash
  end

  def self.allEvents
    arrayOfArrays = []
    charactersHash.each do |character|
      arrayOfArrays << character.last[:events]
    end
    arrayOfArrays
  end

  def self.commonEvents
    allEvents.inject(:&)
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


end
