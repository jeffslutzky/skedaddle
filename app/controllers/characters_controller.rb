class CharactersController < ApplicationController

  def index

  end


end


# <h1>Marvel Comics Data</h1>
#
# <p>(1) Here is a hash containing data for the five characters:</p>
# <p>
#   <%= Character.charactersHash %>
# </p>
#
# <p>(2) Characters Sorted by Popularity</p>
#
# (a) By comics:
# <p>
#   <%= Character.sortByValue(:comics) %>
# </p>
#
# (b) By series:
# <p>
#   <%= Character.sortByValue(:series) %>
# </p>
#
# (c) By stories:
# <p>
#   <%= Character.sortByValue(:stories) %>
# </p>
#
# <p>(3) Events in common</p>
# <p>
#   <%= Character.commonEvents %>
# </p>
