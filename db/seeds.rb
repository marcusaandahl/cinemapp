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
falconer = Cinema.new(
 name: "Nordic Film Cinemas Falconer",
 address: "Sylows Alle 15, 2000 Frederiksberg"
)
falconer.image = url3
falconer.save!

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

puts 'saving movies'




################### ROOMS

puts 'Creating rooms and seats'
cinemas = [empire, park, falconer, palads]
cinemas.each do |cinema|
  5.times do |i|
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
          )
      end
    end
  end
end
