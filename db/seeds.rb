require 'open-uri'
p "clearing lists"
List.destroy_all
p "clearing movies"
Movie.destroy_all
p "clearing bookmarks"
Bookmark.destroy_all

url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=79e9b877b2c4ce705f911a71ae27f79f'
response = JSON.parse(URI.open(url).read)

p "creating movies from first endpoint"
response['results'].each do |movie_hash|
  Movie.create!(title: movie_hash['original_title'], overview: movie_hash['overview'], poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'], rating: movie_hash[:vote_average])
end

p "creating lists"
users = ["Brian", "Patrick", "Martin", "Larry", "Amy", "Jennifer"]
genre = ["Science Fiction", "Fantasy", "Historical", "Comedy", "Romance", "Drama", "Horror"]

users.each do |user|
  new_list = List.create!(name: "#{user}'s favorites")
  file = URI.open("https://source.unsplash.com/#{rand(300..500)}x#{rand(300..500)}/?#{genre.shuffle!.pop}")
  new_list.photo.attach(io: file, filename: 'temp.png', content_type: 'image/png')
end

p "creating bookmarks"

List.all.each do |list|
  movie_array = []
  Movie.all.each do |movie|
    movie_array.push(movie)
  end
  5.times do
    Bookmark.create!(comment: Faker::Lorem.paragraphs, movie: movie_array.shuffle!.pop, list: list)
  end
end
