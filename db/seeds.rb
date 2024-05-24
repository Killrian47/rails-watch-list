require "open-uri"
require "json"

puts "Cleaning database..."
Movie.destroy_all
List.destroy_all
Tag.destroy_all
MovieTag.destroy_all
puts "Database cleaned!"

puts "Creating tags..."
tags = ["Action", "Drame", "Sport"]
tags.each do |tag|
  Tag.create!(name: tag)
end
puts "Tags created!"

puts "Creating movies..."
response = URI.open("https://tmdb.lewagon.com/movie/top_rated").read
data = JSON.parse(response)

data["results"].each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
  MovieTag.create(movie: Movie.last, tag: Tag.all.sample)
end
puts "Movies created!"
