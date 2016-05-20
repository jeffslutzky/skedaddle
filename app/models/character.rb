class Character < ActiveRecord::Base

  def self.characters
    characters = {}
    Character.all.each do |character|
      characters[character.name] = {character_id: character.character_id, comics: character.comics, series: character.series, stories: character.stories }
    end
    characters
  end

  def self.sortByValue(value)
    characters.sort_by { |name, data| data[value] }.reverse
  end


end
