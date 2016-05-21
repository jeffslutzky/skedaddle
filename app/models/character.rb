class Character < ActiveRecord::Base

  def self.charactersHash
    characters = {}
    Character.all.each do |character|
      characters[character.name] = {character_id: character.character_id, comics: character.comics, series: character.series, stories: character.stories, events: character.characterEventsArray, thumbnail_path: character.thumbnail_path }
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

  def imageUrl(character)
    "#{character.thumbnail_path}/standard_small.jpg"
  end


# not needed:

  def self.comicsHash
    {"spider-man":2613, "iron man":1986, "captain america":1445, "hulk":1315, "thor":1254}
  end

  def self.seriesHash
    {"spider-man":545, "iron man":451, "captain america":395, "hulk":319, "thor":309}
  end

  def self.storiesHash
    {"spider-man":4223, "iron man":2911, "captain america":2360, "hulk":1988, "thor":1970}
  end

# : not needed


end
