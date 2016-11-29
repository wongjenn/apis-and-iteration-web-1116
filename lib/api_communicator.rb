require 'rest-client'
require 'json'
require 'pry'

def request_web(url)
  #make the web request
  all_characters = RestClient.get(url)
  character_hash = JSON.parse(all_characters)
end


def get_film_url(character)
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  character_hash = request_web('http://www.swapi.co/api/people/')
  movie_api = Array.new(0)

  character_hash["results"].each do |key, value|
    if key["name"].upcase == character.upcase
      movie_api = key["films"]
    end
  end
  movie_api
end

def get_character_movies_from_api(character)
  movie_api = get_film_url(character)
#  binding.pry

  movie_api.collect do |url|
    movie_link = RestClient.get(url)
    movie = JSON.parse(movie_link)
  end
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end



def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list

  if films_hash.empty?
    puts "Sorry, that character does not exist or name is spelled wrong"
    return
  else
    films_hash.each do |key, value|
      puts key["title"]
    end
  end
end

# parse_character_movies(get_character_movies_from_api("Luke Skywalker"))

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?



def show_movie_info(movie)
  movies_hash = request_web("http://swapi.co/api/films/")

  movies_hash["results"].each do |key, value|
    if key["title"].upcase == movie.upcase
      puts key["opening_crawl"]
    end
  end
end
