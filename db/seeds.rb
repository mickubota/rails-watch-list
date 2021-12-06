require 'open-uri'
p "clearing lists"
List.destroy_all
p "clearing movies"
Movie.destroy_all
p "clearing bookmarks"
Bookmark.destroy_all
# List.destroy_all

# the Le Wagon copy of the API
url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=79e9b877b2c4ce705f911a71ae27f79f'
response = JSON.parse(URI.open(url).read)
# other_url = "https://api.themoviedb.org/3/movie/top_rated?api_key=79e9b877b2c4ce705f911a71ae27f79f"
# second_response = JSON.parse(URI.open(other_url).read)

# last_url = "https://api.themoviedb.org/3/movie/now_playing?api_key=<<api_key>>&language=en-US&page=1"
# third_response = JSON.parse(URI.open(other_url).read)

p "creating movies from first endpoint"
response['results'].each do |movie_hash|
  # create an instance with the hash
# Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)

  Movie.create!(title: movie_hash['original_title'], overview: movie_hash['overview'], poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'], rating: movie_hash[:vote_average])
  #   poster_url: title*"https://image.tmdb.org/t/p/w500" + movie_hash['poster_path']
  #   ...
  # )
end

# p "creating movies from second endpoint"
# second_response['results'].each do |movie_hash|
#   # create an instance with the hash
# # Movie.create!(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)

#   Movie.create!(title: movie_hash['original_title'], overview: movie_hash['overview'], poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'], rating: movie_hash[:vote_average])
#   #   poster_url: title*"https://image.tmdb.org/t/p/w500" + movie_hash['poster_path']
#   #   ...
#   # )
# end

p "creating lists"
users = ["Brian", "Patrick", "Martin", "Larry"]

users.each do |user|
  List.create!(name: "Most popular movies of 2021 from #{user}")
end

p "creating bookmarks"

List.all.each do |list|
  5.times do
    movie_array = []
    Movie.all.each do |movie|
      movie_array.push(movie)
    end
    movie_array_sample = movie_array.shuffle!.pop
    Bookmark.create!(comment: Faker::Lorem.paragraphs, movie: movie_array_sample, list: list)
  end
end
