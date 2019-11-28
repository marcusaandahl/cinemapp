# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Clearing database'

User.destroy_all
Movie.destroy_all
Cinema.destroy_all
Room.destroy_all
Seat.destroy_all
Session.destroy_all
Booking.destroy_all
Order.destroy_all


puts 'Creating users'

henderson = User.new(
 name: "Henderson Pinto",
 # location: Faker::Address.full_address,
 email: "henderson@cinemapp.com",
 password: "1234567"
 )
henderson.save!

rasmus = User.new(
 name: "Rasmus Melberg",
 # location: Faker::Address.full_address,
 email: "rasmus@cinemapp.com",
 password: "1234567"
 )
rasmus.save!


marcus = User.new(
 name: "Marcus Aandahl",
 # location: Faker::Address.full_address,
 email: "marcus@cinemapp.com",
 password: "1234567"
 )
marcus.save!

juliana = User.new(
 name: "Juliana Geller",
 # location: Faker::Address.full_address,
 email: "juliana@cinemapp.com",
 password: "1234567"
 )
juliana.save!
puts 'saving users'



################### CINEMAS

# CINEMAS= [
#   { name: "Empire Cinema", address: "Guldbergsgade 29F, 2200 København" },
#   { name: "Empire Cinema", address: "Guldbergsgade 29F, 2200 København" },
#   { name: "Empire Cinema", address: "Guldbergsgade 29F, 2200 København" },
#   { name: "Empire Cinema", address: "Guldbergsgade 29F, 2200 København" }
# ]

# CINEMAS.each do |cinema_params|
#   cinema = Cinema.new(cinema_params)
#   cinema.save!

#   # Create rooms for the cinema

#     # Create seats for the room
# end

puts 'Creating cinemas'

url1 = "http://www.cinema.com.my/images/news/2019/7n_malaysianewcinemas00.jpg"
empire = Cinema.new(
 name: "Empire Cinema",
 address: "Guldbergsgade 29F, 2200 København"
)
empire.image = url1
empire.save!

url2 = "https://files.guidedanmark.org/files/382/174564_Park_Bio.jpg?qfix"
park = Cinema.new(
 name: "Park Bio",
 address: "Østerbrogade 79, 2100 København"
)
park.image = url2
park.save!

url3 = "https://www.airbnb.com/google_place_photo?photoreference=CmRaAAAAe5WJ435w4SOA0omQku7aZZhjp4YXwcrgayN6R_eRmBMo8PfZLZtXVnAxZj4uU7obIvpU9uOUAIQ0ajaGWGVts1NOVhgKqsjw9T0B1pIrUECVVVrj4Dfb1Zhc-JxwUaQmEhCkIyRFHpttf-kMGEjZbBgCGhRNjEvKsmi8Qa-jWsWEbEjq41IbLg&maxwidth=1000&maxheight=1000&place_id=31244"
falkoner = Cinema.new(
 name: "Falkoner",
 address: "Sylows Alle 15, 2000 Frederiksberg"
)
falkoner.image = url3
falkoner.save!

url4 = "https://www.kino.dk/sites/default/files/styles/k_16-9_big/public/cinema/paladsny.jpg"
palads = Cinema.new(
 name: "Palads Teatret",
 address: "Axeltorv 9, 1609 København"
)
palads.image = url4
palads.save!

puts 'saving cinemas'








################### MOVIES

puts 'Creating movies'
terminator = Movie.new(
 name: "Terminator: Dark Fate",
 description: "Sarah Connor and a hybrid cyborg human must protect a young girl from a newly modified liquid Terminator from the future.",
 image: "p2c4tgmi6ezuls4pab8i"
)
terminator.save!
joker = Movie.new(
 name: "Joker",
 description: "In Gotham City, mentally-troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: 'The Joker'.",
 image: "rvygxupdxvaz7abeshjm"
)
joker.save!
lion_king = Movie.new(
 name: "The Lion King",
 description: "After the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.",
 image: "b5gogdptnfaiiwp86ix0"
)
lion_king.save!
avengers = Movie.new(
 name: "Avengers: Endgame",
 description: "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
 image: "aubq8owobhfenou9yety"
)
avengers.save!
toystory = Movie.new(
 name: "Toy Story 4",
 description: "When a new toy called 'Forky' joins Woody and the gang, a road trip alongside old and new friends reveals how big the world can be for a toy.",
 image: "pev2ejfpwrqrjm2vfiqd"
)
toystory.save!
lastxmas = Movie.new(
 name: "Last Christmas",
 description: "Nothing seems to go right for young Kate, a frustrated Londoner who works as an elf in a year-round Christmas shop. But things soon take a turn for the better when she meets Tom.",
 image: "https://dx35vtwkllhj9.cloudfront.net/universalstudios/last-christmas/images/regions/us/onesheet.jpg"
)
lastxmas.save!
fordvferrari = Movie.new(
 name: "Ford v Ferrari",
 description: "American automotive designer Carroll Shelby and fearless British race car driver Ken Miles battle corporate interference.",
 image: "https://images.fandango.com/ImageRenderer/0/0/redesign/static/img/default_poster.png/0/images/masterrepository/Fandango/207162/FVF_Pitlane__VerB_Poster_05.jpg"
)
fordvferrari.save!
maleficent = Movie.new(
 name: "Maleficent: Mistress of Evil",
 description: "Maleficent travels to a grand old castle to celebrate young Aurora's upcoming wedding to Prince Phillip. While there, she meets Aurora's future mother-in-law.",
 image: "https://www.chroniquedisney.fr/imgFilm/2010/2014-malefique-01-big.jpg"
)
maleficent.save!
addams = Movie.new(
 name: "The Addams Family",
 description: "Members of the mysterious and spooky Addams family -- Gomez, Morticia, Pugsley, Wednesday, Uncle Fester and Grandma -- are readily preparing for a visit from their even creepier relatives.",
 image: "https://poster.ninja/wp-content/uploads/2019/08/The-Addams-Family-2019-Poster-1.jpg"
)
addams.save!
midway = Movie.new(
 name: "Midway",
 description: "On Dec. 7, 1941, Japanese forces launch a devastating attack on Pearl Harbor, the U.S. naval base in Hawaii. Six months later, the Battle of Midway commences.",
 image: "https://cdn.traileraddict.com/content/lionsgate/midway-2019-poster-14.jpg"
)
midway.save!
dowton = Movie.new(
 name: "Downton Abbey",
 description: "Excitement is high at Downton Abbey when the Crawley family learns that King George V and Queen Mary are coming to visit.",
 image: "https://m.media-amazon.com/images/M/MV5BMmQxNGRkMjYtZTAyMy00MDUyLThiNmYtODI1NTkyNmI0ZTNlXkEyXkFqcGdeQXVyMjM4NTM5NDY@._V1_.jpg"
)
dowton.save!
apocalypse = Movie.new(
 name: "Apocalypse Now",
 description: "Captain Willard is sent to Cambodia on a dangerous mission to assassinate a renegade colonel who has won the trust of a local tribe.",
 image: "https://m.media-amazon.com/images/M/MV5BZTNkZmU0ZWQtZjQzMy00YTNmLWFmN2MtZGNkMmU1OThmMGYwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg"
)
apocalypse.save!
matrix = Movie.new(
 name: "The Matrix",
 description: "Thomas Anderson, a computer programmer, is led to fight an underground war against powerful computers who have constructed his entire reality with a system called the Matrix.",
 image: "https://static1.squarespace.com/static/588a4776f5e23132a09d23b2/588a4e91be65945e50a36c0e/599f2cdc9f745634b2be9dd9/1503604517004/Matrix.jpg?format=1000w"
)
matrix.save!
social = Movie.new(
 name: "The Social Network",
 description: "Mark Zuckerberg creates a social networking site, Facebook, with the help of his friend Eduardo Saverin.",
 image: "https://movieposters2.com/images/695417-b.jpg"
)
social.save!
nightmare = Movie.new(
 name: "The Nightmare Before Christmas",
 description: "Jack Skellington, a being from Halloween Town, finds Christmas Town and is instantly enchanted.",
 image: "https://m.media-amazon.com/images/M/MV5BNWE4OTNiM2ItMjY4Ni00ZTViLWFiZmEtZGEyNGY2ZmNlMzIyXkEyXkFqcGdeQXVyMDU5NDcxNw@@._V1_SY1000_CR0,0,666,1000_AL_.jpg"
)
nightmare.save!
ferris = Movie.new(
 name: "Ferris Bueller's Day Off",
 description: "Ferris Bueller, a high school student, fakes sickness to stay at home and spends the rest of the day with his best friend and girlfriend.",
 image: "https://upload.wikimedia.org/wikipedia/en/9/9b/Ferris_Bueller%27s_Day_Off.jpg"
)
ferris.save!
movies = [terminator, joker, lion_king, avengers, toystory, lastxmas, fordvferrari, maleficent, addams, midway, dowton, apocalypse, matrix, social, nightmare, ferris]
puts 'saving movies'












################### ROOMS

puts 'Creating rooms and seats'
cinemas = [empire, park, falkoner, palads]
cinemas.each do |cinema|
  4.times do |i|
    room = Room.create(
     name: "Room #{i}",
     cinema: cinema,
    )
    6.times do |row|
      10.times do |column|
        seat = Seat.create(
          row: row,
          column: column,
          room: room,
          booked:[true, false, true, true, true].sample
          # booked:false
          )
      end
    end
  end
end







puts 'Creating sessions'
session_times = [DateTime.now, (DateTime.now + 1.hours), (DateTime.now + 3.hours), (DateTime.now + 5.hours)]
cinemas.each do |cinema|
  cinema.rooms.each.with_index do |room, index|
   session_times.each do |showtime|

sesh = Session.new(
  room: room,
  movie: movies[index],
  showtime: showtime,
  base_price: 120,
  max_discount: 40,
  min_empty_seats:50, #This is the minimum value (in percentage) of empty seats for which the ticket price will be the lowest accepted.
  hours_for_discount:24,
)
sesh.save!
# sesh2 = Session.new(
#   room: room,
#   movie: movies[4+index],
#   showtime: showtime + 1.hours,
#   base_price: 120,
#   max_discount: 40,
#   min_empty_seats:50, #This is the minimum value (in percentage) of empty seats for which the ticket price will be the lowest accepted.
#   hours_for_discount:3,
# )
# sesh2.save!
    end
  end
end

sessions = Session.all





# sesh = Session.new(
#   room: Cinema.second.rooms.first,
#   movie: joker,
#   showtime: DateTime.now + 36.hours,
#   base_price: 180,
#   max_discount: 40,
#   min_empty_seats:40, #This is the minimum value (in percentage) of empty seats for which the ticket price will be the lowest accepted.
#   hours_for_discount:24,
# )
# sesh.save!

# sesh = Session.new(
#   room: Cinema.first.rooms.first,
#   movie: terminator,
#   showtime: DateTime.now + 12.hours,
#   base_price: 120,
#   max_discount: 40,
#   min_empty_seats:40, #This is the minimum value (in percentage) of empty seats for which the ticket price will be the lowest accepted.
#   hours_for_discount:24,
# )
# sesh.save!

# sesh = Session.new(
#   room: Cinema.first.rooms.first,
#   movie: lion_king,
#   showtime: DateTime.now - 24.hours,
#   base_price: 160,
#   max_discount: 40,
#   min_empty_seats:40, #This is the minimum value (in percentage) of empty seats for which the ticket price will be the lowest accepted.
#   hours_for_discount:24,
# )
# sesh.save!











########  Orders

puts 'creates an order'

order1 = Order.new(
  user: henderson,
  state: "completed"
  )
order1.save!

order2 = Order.new(
  user:marcus,
  state: "completed"
  )
order2.save!

########  Bookings

puts 'creating a booking'

booking1 = Booking.new(
  order: order1,
  session: sessions[1],
  seat:Seat.first,
  )
booking1.save!

booking2 = Booking.new(
  order: order1,
  session: sessions[1],
  seat:Seat.last,
  )
booking2.save!


booking3 = Booking.new(
  order: order1,
  session: sessions[0],
  seat:Seat.second,
  )
booking3.save!

booking4 = Booking.new(
  order: order1,
  session: sessions[2],
  seat:Seat.third,
  )
booking4.save!

booking5 = Booking.new(
  order: order1,
  session: sessions[3],
  seat:Seat.third,
  )
booking5.save!

booking6 = Booking.new(
  order: order2,
  session: sessions[2],
  seat:Seat.last,
  )
booking6.save!
order1.update(price: order1.price_update)
order2.update(price: order2.price_update)
