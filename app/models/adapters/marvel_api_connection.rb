module Adapters
  class MarvelApiConnection
    include HTTParty

    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def base_URL
      "http://gateway.marvel.com:80/v1/public/characters"
    end

    def timestamp
      Time.now.to_i
    end

    def md5hash
      Digest::MD5.hexdigest("#{timestamp}" + "#{ENV['private_API_key']}" + "#{ENV['public_API_key']}")
    end

    def URL(character)
      "#{self.base_URL}?name=#{character}&ts=#{self.timestamp}&apikey=#{ENV['public_API_key']}&hash=#{self.md5hash}"
    end

  end
end
