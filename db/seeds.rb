# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Movie.destroy_all
# List.destroy_all

# Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# List.create(name: "List 1")
# List.create(name: "List 2")
# List.create(name: "List 3")
# List.create(name: "List 4")
# List.create(name: "List 5")

# Bookmark.create

require 'open-uri'
List.destroy_all
Movie.destroy_all
Bookmark.destroy_all
# List.destroy_all

# the Le Wagon copy of the API
url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=79e9b877b2c4ce705f911a71ae27f79f'
response = JSON.parse(URI.open(url).read)
other_url = "https://api.themoviedb.org/3/movie/top_rated?api_key=79e9b877b2c4ce705f911a71ae27f79f"
second_response = JSON.parse(URI.open(other_url).read)

last_url = "https://api.themoviedb.org/3/movie/now_playing?api_key=<<api_key>>&language=en-US&page=1"
third_response = JSON.parse(URI.open(other_url).read)

response['results'].each do |movie_hash|
  # create an instance with the hash
# Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)

  Movie.create!(title: movie_hash['original_title'], overview: movie_hash['overview'], poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'], rating: movie_hash[:vote_average])
  #   poster_url: title*"https://image.tmdb.org/t/p/w500" + movie_hash['poster_path']
  #   ...
  # )
end

second_response['results'].each do |movie_hash|
  # create an instance with the hash
# Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)

  Movie.create!(title: movie_hash['original_title'], overview: movie_hash['overview'], poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'], rating: movie_hash[:vote_average])
  #   poster_url: title*"https://image.tmdb.org/t/p/w500" + movie_hash['poster_path']
  #   ...
  # )
end

randomizer_array = (1..20).to_a

4.times do
  List.create!(name: "#{Faker::TvShows::RickAndMorty.character}#{randomizer_array.sample}")
end

15.times do
  Bookmark.create!(comment: Faker::ChuckNorris.fact, movie: Movie.all.sample, list: List.all.sample)
end
