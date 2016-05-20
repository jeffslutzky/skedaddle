class CharactersController < ApplicationController

  def index
    client = Adapters::MarvelApiConnection.new

  end


end
