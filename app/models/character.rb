class Character < ActiveRecord::Base

  def getData(name)
    client = Adapters::MarvelApiConnection.new
    result = client.query(name)
    characterData = result["data"]["results"].first
  end

end
