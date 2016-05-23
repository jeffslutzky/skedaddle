== README

Here are some of the choices I made in completing this project:

I accessed the Marvel API data using the HTTParty gem. I used the Figaro gem to hide my API key.

I seeded the database with the API data, so the database is preloaded, and the model interacts with the data through the database instead of through the API directly (except for characters' events, where it does interact directly with the API).

Since I was going to be accessing the character data hash several times, I used conditional assignment to an instance variable (@characterHash ||= etc.) in the self.charactersHash class method. That way, if the hash is already populated with data, the method doesn't need to access the database again. This speeds things up immensely.

I created a partial (_sorted.html.erb) to hold the code for a sorted table, and in the view I loop through the partial to load sorted tables for comics, series, and stories. This makes my code more DRY.

For common events, I made a nested array of everyone's events (self.allEvents), and then created a separate class method to find the events common to all arrays in the nested array (self.commonEvents).

I graphed the characters' popularity by series using the chartkick gem.
