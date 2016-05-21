module Adapters
  class MarvelApiConnection
    include HTTParty

    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def baseUrl
      "http://gateway.marvel.com/v1/public/characters"
    end

    def timestamp
      Time.now.to_i
    end

    def md5hash
      Digest::MD5.hexdigest("#{timestamp}" + "#{ENV['private_API_key']}" + "#{ENV['public_API_key']}")
    end

    def urlSuffix
      "ts=#{self.timestamp}&apikey=#{ENV['public_API_key']}&hash=#{self.md5hash}"
    end

    def url(character)
      "#{self.baseUrl}?name=#{character}&#{self.urlSuffix}"
    end

    def query(character)
      connection.get(self.url(character))
    end

    def characterID(character)
      self.query(character)["data"]["results"].first["id"]
    end

    def eventsUrl(character)
      "#{self.baseUrl}/#{self.characterID(character)}/events?&limit=100&#{self.urlSuffix}"
    end

    def eventsQuery(character)
      connection.get(self.eventsUrl(character))
    end

  end
end
