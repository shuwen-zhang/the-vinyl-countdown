# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Vinyl.delete_all
Artist.delete_all

artists = ["Erykah Badu", "Stevie Wonder", "D'Angelo", "Django Reinhardt", 
			 "Oscar Peterson", "Erroll Garner", "Elis Regina"]

artists.each do |artist|
  Artist.create(name: artist)
end

vinyls = [
  {
    "title" => 'Baduizm',
    "runtime" => 58,
    "year" => 1997,
    "image_url" => 'https://images-na.ssl-images-amazon.com/images/I/41JFM6snWeL.jpg',
    "artist" => 'Erykah Badu'
  },
  {
    "title" => 'Songs in the Key of Life',
    "runtime" => 104,
    "year" => 1976,
    "image_url" => 'https://cdn.shopify.com/s/files/1/0902/5612/products/stevie_wonder_songs_in_the_key_of_life_vinyl_front_cover.JPG',
    "artist" => 'Stevie Wonder'
  },
  {
    "title" => 'Black Messiah',
    "runtime" => 56,
    "year" => 2014,
    "image_url" => 'https://images-na.ssl-images-amazon.com/images/I/81jje9eRgoL._SX355_.jpg',
    "artist" => "D'Angelo"
  },
  {
    "title" => 'Djangology',
    "runtime" => 63,
    "year" => 1961,
    "image_url" => 'https://img.discogs.com/S4yyfnEPFeGudEvglv58yN8FZN4=/fit-in/600x596/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2982477-1315619247.jpeg.jpg',
    "artist" => 'Django Reinhardt'
  },
  {
    "title" => 'Oscar Peterson at the Stratford Shakespearean Festival',
    "runtime" => 75,
    "year" => 1956,
    "image_url" => 'https://cps-static.rovicorp.com/3/JPG_500/MI0000/716/MI0000716209.jpg?partner=allrovi.com',
    "artist" => 'Oscar Peterson'
  },
  {
    "title" => 'Erroll Garner Plays Misty',
    "runtime" => 34,
    "year" => 1961,
    "image_url" => 'https://img.discogs.com/IWHjCwACnJG6bLt4QZg0aHAdNeA=/fit-in/600x597/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-1508173-1224896324.jpeg.jpg',
    "artist" => 'Erroll Garner'
  },
  {
    "title" => 'Elis & Tom',
    "runtime" => 38,
    "year" => 1974,
    "image_url" => 'https://img.discogs.com/P-tAcrEleTPrLrxLK89mTXGNb20=/fit-in/600x597/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-1591344-1502579672-4629.jpeg.jpg',
    "artist" => 'Elis Regina'
  }
]


vinyls.each do |vinyl_data|
  v = Vinyl.new
  v.title = vinyl_data["title"]
  v.runtime = vinyl_data["runtime"]
  v.year = vinyl_data["year"]
  v.image_url = vinyl_data["image_url"]
  v.artist = Artist.find_by(name: vinyl_data["artist"])
  #if m.director == nil
    #m.director = Director.first
  #end
  v.save
end


users = [{"username" => "Tom", "password" => "Jerry"}, {"username" => "Silvester", "password" => "Tweety"}]

users.each do |user|
  u = User.new
  u.username = user["username"]
  u.password = user["password"]
  u.save
end


print "There are now #{Vinyl.count} vinyls in the database.\n"
print "There are now #{Artist.count} artists in the database.\n"
