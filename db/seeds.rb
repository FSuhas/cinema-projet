require 'open-uri'
require 'json'
require 'date'


puts "------------------------------"
puts "----------Start seed----------"
puts "------------------------------"
sleep(1)

puts "#destroy_all start ..."

Booking.destroy_all

Book.destroy_all

Post.destroy_all

User.destroy_all

puts "#destroy_all finish !"
sleep(1)
puts "User seed start..."

fabien = User.new(email: 'fabien@test.com',
  password: 'azerty',
  nom: 'Suhas',
  prenom: 'Fabien',
  adresse: '3 rue winston churchill 77100 Meaux',
  telephone: '06.23.16.20.02',
  date_de_naissance: '1986.08.13',
  sexe: 'Homme',
  infos: 'Blond grand aux yeux bleus',
  role: ''
)

fabien.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?man"), filename: "fabien.png", content_type: "image/png")

fabien.save!

jessica = User.new(email: 'jessica@test.com',
  password: 'azerty',
  nom: 'Bolle',
  prenom: 'Jessica',
  adresse: '3 rue winston chruchill 77100 Meaux',
  telephone: '06.19.75.78.56',
  date_de_naissance: '1984-07-04',
  sexe: 'Femme',
  infos: 'Trop gentille',
  role: ''
)

jessica.save!

lael = User.new(email: 'lael@test.com',
  password: 'azerty',
  nom: 'Bolle Suhas',
  prenom: 'Laël',
  adresse: '3 rue winston chruchill 77100 Meaux',
  telephone: '',
  date_de_naissance: '',
  sexe: 'Homme',
  infos: '',
  role: ''
)

lael.save!

puts "user seed finish !"
sleep(1)
puts "Post seed start..."

jessica_post = Post.new(titre: 'Post de Jessica',
  role: 'Figurant',
  age: '25',
  genre: 'Homme',
  ville: 'Paris',
  departement: '75',
  lieux: 'Paris',
  date: '2021-01-01',
  descriptif: 'Bonjour, je suis Jessica et je recherche un acteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: jessica
)

jessica_post.photos.attach(io: URI.open("https://source.unsplash.com/random?actrice"), filename: "jessica_post.png", content_type: "image/png")

jessica_post.save!

jessica_post_two = Post.new(titre: 'Post de Jessica 2',
  role: 'Doublure',
  age: '25',
  genre: 'Femme',
  ville: 'Meaux',
  departement: '77',
  lieux: 'Meaux',
  date: '2021-01-01',
  descriptif: 'Bonjour, je suis Jessica et je recherche un acteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: jessica
)

jessica_post_two.photos.attach(io: URI.open("https://source.unsplash.com/random?cinema"), filename: "jessica_post_two.png", content_type: "image/png")

jessica_post_two.save!

lael_post = Post.new(titre: 'Post de Lael',
  role: 'Figurant',
  age: '25',
  genre: 'Homme',
  departement: '40',
  date: '2021-01-01',
  descriptif: 'Bonjour, je suis Lael et je recherche un recruteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: lael
)

lael_post.save

lael_post_two = Post.new(titre: 'Post de Lael 2',
  role: 'Silhouette',
  age: '25',
  genre: 'Femme',
  ville: 'Bayonne',
  date: '2021-01-01',
  descriptif: 'Bonjour, je suis Lael et je recherche un recruteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: lael
)

lael_post_two.save

puts "Post seed finish !"
sleep(1)

puts "------------------------------"
puts "----------Start seed----------"
puts "------------------------------"

sleep(1)
