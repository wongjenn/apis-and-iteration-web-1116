def welcome
  puts "Welcome to Star Wars! "
end

def get_user_choice
  puts " 'C' to enter a character name"
  puts " 'M' to enter a Movie name"
  response = gets.chomp
  movie_or_character(response)
end

def movie_or_character(input)
  if input.upcase == "C"
    get_character_from_user
  elsif input.upcase == "M"
    get_movie_from_user
  else
    puts "Invalid input"
  end
end

def get_character_from_user
  puts "please enter a character"
  character = gets.chomp
  show_character_movies(character)
  # use gets to capture the user's input. This method should return that input, downcased.
end


def get_movie_from_user
  puts "please enter a movie"
  movie = gets.chomp
  show_movie_info(movie)
end
