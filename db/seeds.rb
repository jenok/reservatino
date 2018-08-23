# This file should contain all the record creation needed to seed the database with its default valu
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "yaml"

Review.destroy_all
Reservation.destroy_all
Chef.destroy_all
Menu.destroy_all
Image.destroy_all
Restaurant.destroy_all
Customer.destroy_all

customer = Customer.new(name: "customer1", email: 'customer1@ab.com', password: "123456")
customer.save!

customer2 = Customer.new(name: "customer2", email: 'customer2@ab.com', password: "123456")
customer2.save!

customer3 = Customer.new(name: "customer3", email: 'customer3@ab.com', password: "123456")
customer3.save!

customer4 = Customer.new(name: "customer4", email: 'customer4@ab.com', password: "123456")
customer4.save!



restaurant = Restaurant.new(email: 'restaurant1@xyz.com', name: "Tim Raue", password: "123123", opening_hours: "9:00-23:00", category: "high-end", style: "old-fashioned", cuisine: "french", tel: "08156666666", country: "Germany", city: "Berlin", address: "Rudi Dutschkestr.26", pictures: ["http://res.cloudinary.com/dxhdlrmdm/image/upload/v1534930534/TRLogo.jpg"])
restaurant.save!

restaurant2 = Restaurant.new(email: 'restaurant2@xyz.com', name: "McD Ostbahnhof", password: "123123", opening_hours: "9:00-23:00", category: "cheap", style: "hip", cuisine: "americano", tel: "081573223", country: "Germany", city: "Berlin", address: "Am Ostbahnhof 9", pictures: ["http://res.cloudinary.com/dxhdlrmdm/image/upload/v1534930553/TraubeTonbach.jpg"])
restaurant2.save!

restaurant3 = Restaurant.new(email: 'restaurant3@xyz.com', name: "McD Hermannplatz", password: "123123", opening_hours: "9:00-23:00", category: "cheap", style: "hip", cuisine: "americano", tel: "081573223", country: "Germany", city: "Berlin", address: "Hermannpl. 2-3", pictures: ["http://res.cloudinary.com/dxhdlrmdm/image/upload/v1534930604/Restaurant-FACIL-Berlin.jpg"])
restaurant3.save!

restaurant4 = Restaurant.new(email: 'restaurant4@xyz.com', name: "McD Alexanderplatz", password: "123123", opening_hours: "9:00-23:00", category: "cheap", style: "hip", cuisine: "americano", tel: "081573223", country: "Germany", city: "Berlin", address: "Karl-Liebknecht-Str. 13", pictures: ["http://res.cloudinary.com/dxhdlrmdm/image/upload/v1534930534/TRLogo.jpg"])
restaurant4.save!



reservation = Reservation.new(time: DateTime.new(2018,8,25), customer: customer,  seats: 1, restaurant: restaurant)
reservation.save!

reservation2 = Reservation.new(time: DateTime.new(2018,8,25), customer: customer2, seats: 2, restaurant: restaurant2)
reservation2.save!

reservation3 = Reservation.new(time: DateTime.new(2018,8,25), customer: customer3, seats: 3, restaurant: restaurant3)
reservation3.save!

reservation4 = Reservation.new(time: DateTime.new(2018,8,25), customer: customer4, seats: 4, restaurant: restaurant4)
reservation4.save!



review = Review.new(rating: 3, comment: "Great!", customer: customer4, restaurant: restaurant)
review.save!

review2 = Review.new(rating: 1, comment: "Shit!", customer: customer4, restaurant: restaurant2)
review2.save!

review3 = Review.new(rating: 2, comment: "Average!", customer: customer4, restaurant: restaurant3)
review3.save!

review4 = Review.new(rating: 3, comment: "Awesome!", customer: customer4, restaurant: restaurant4)
review4.save!



chef = Chef.new(name: "Chef1", restaurant: restaurant, avatar: "Harald-Wohlfahrt-06.jpg", profile: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni sunt aliquid aut accusamus ducimus, dolor adipisci quis dolores. Voluptate totam dolores dignissimos voluptatibus. Consequuntur, sequi repellat aliquid consequatur voluptatibus! Neque!")
chef.save!

chef2 = Chef.new(name: "Chef2", restaurant: restaurant2, avatar:"michael-kempf.jpg", profile: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit nobis aut obcaecati error quisquam ratione officiis, quo iusto optio velit eos voluptatem corrupti fugit quae, quia temporibus molestiae? Tempore, molestiae!")
chef2.save!

chef3 = Chef.new(name: "Chef3", restaurant: restaurant3, avatar: "TimRaue.jpg", profile: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque reprehenderit repudiandae doloremque iure, repellendus, delectus velit ducimus repellat natus vitae maiores sequi deserunt. Modi, iste nostrum iusto explicabo quo tenetur!")
chef3.save!

chef4 = Chef.new(name: "Chef4", restaurant: restaurant4, avatar: "?", profile: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Totam dolor blanditiis, quos sed assumenda. Culpa temporibus, quam perferendis cupiditate suscipit! Earum saepe autem eum provident corrupti incidunt, harum repellat voluptas!")
chef4.save!



menu = Menu.new(name: "Menu1", image: "food2.jpg", price: "250", restaurant: restaurant)
menu.save!

menu2 = Menu.new(name: "Menu2", image: "Facil.jpeg", price: "25", restaurant: restaurant2)
menu2.save!

menu3 = Menu.new(name: "Menu3", image: "TRasparagus.jpeg", price: "50", restaurant: restaurant3)
menu3.save!

menu4 = Menu.new(name: "Menu4", image: "?", price: "500", restaurant: restaurant4)
menu4.save!



# image = Image.new(image_url: "http://res.cloudinary.com/dxhdlrmdm/image/upload/v1534930553/TraubeTonbach.jpg")

# image.save!

# image2 = Image.new(image_url: "http://res.cloudinary.com/dxhdlrmdm/image/upload/v1534930604/Restaurant-FACIL-Berlin.jpg")
# image2.save!

# image3 = Image.new(image_url: "http://res.cloudinary.com/dxhdlrmdm/image/upload/v1534930534/TRLogo.jpg")
# image3.save!

# image4 = Image.new(image_url: "?")
# image4.save!
