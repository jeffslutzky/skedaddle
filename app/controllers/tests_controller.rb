class TestsController < ApplicationController

  def index
    client = Adapters::MarvelApiConnection.new

    binding.pry
  end

end
