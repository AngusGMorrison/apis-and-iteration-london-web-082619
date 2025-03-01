require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_hash = get_api_response('http://www.swapi.co/api/people/')
  movies = response_hash["results"][0]["films"]
  get_movie_data(movies)
end

def get_api_response(url)
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def get_movie_data(character_movies)
  character_movies.map() { | movie | get_api_response(movie) }
end


def print_movies(films)
  films.each() { | hash | puts hash["title"] }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end