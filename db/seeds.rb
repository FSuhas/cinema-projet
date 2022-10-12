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

fabien = User.new(email: 'fabien@test.com', password: 'azerty', nom: 'Suhas', prenom: 'Fabien', departement: '77',
  telephone: '06.23.16.20.02', sexe: :Homme, date_de_naissance: '1986.08.13', infos: 'Blond grand aux yeux bleus',
  role: 'candidat'
)

fabien.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?man"), filename: "fabien.png", content_type: "image/png")

fabien.save!

jean = User.new(email: 'jean@test.com', password: 'azerty', nom: 'Jean', prenom: 'Test',  departement: '',
  telephone: '', sexe: '', date_de_naissance: '', infos: '',
  role: 'recruteur'
)

jean.save!

jessica = User.new(email: 'jessica@test.com', password: 'azerty', nom: 'Bolle', prenom: 'Jessica', departement: '',
  telephone: '', sexe: '', date_de_naissance: '', infos: '',
  role: 'recruteur'
)


jessica.save!

axel = User.new(email: 'ngagecast@gmail.com', password: 'azerty', nom: 'Laufer', prenom: 'Axel', departement: '75',
  telephone: '', sexe: '', date_de_naissance: '', infos: 'Chargée de recrutement',
  role: 'recruteur'
)

axel.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?man"), filename: "axel.png", content_type: "image/png")

axel.save!

franck = User.new(email: 'jouardcasting@icloud.com', password: 'azerty', nom: 'Jouard', prenom: 'Franck', departement: '78',
  telephone: '', sexe: '', date_de_naissance: '', infos: 'Chargée de recrutement',
  role: 'recruteur'
)

franck.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?boy"), filename: "franck.png", content_type: "image/png")

franck.save!

lael = User.new(email: 'lael@test.com', password: 'azerty', nom: 'Bolle Suhas', prenom: 'Laël', departement: '77',
  telephone: '06.23.16.20.02', sexe: :Homme,  date_de_naissance: '2016-01-18', infos: 'Jeune garçon blond aux yeux bleus',
  role: 'candidat'
)

lael.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?"), filename: "lael.png", content_type: "image/png")

lael.save!

noevan = User.new(email: 'noevan@test.com',  password: 'azerty', nom: 'Bolle Suhas', prenom: 'Noëvan', departement: '77',
  telephone: '06.23.16.20.02',  sexe: :Homme, date_de_naissance: '2020-10-04', infos: 'Jeune garçon blond aux yeux bleus',
  role: 'candidat'
)

noevan.photo.attach(io: URI.open("https://source.unsplash.com/random?man"), filename: "noevan.png", content_type: "image/png")

noevan.save!

puts "user seed finish !"
sleep(1)
puts "Post seed start..."

jessica_post = Post.new(titre: 'Post de Jessica',
  age: '18-25',
  genre: 'Homme',
  departement: '75',
  date: '2022-01-12',
  descriptif: 'Bonjour, je suis Jessica et je recherche un acteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: jessica
)

jessica_post.photos.attach(io: URI.open("https://source.unsplash.com/random?actrice"), filename: "jessica_post.png", content_type: "image/png")

jessica_post.save!

jessica_post_two = Post.new(titre: 'Post de Jessica 2',
  age: '25-35',
  genre: 'Femme',
  departement: '77',
  date: '2023-01-01',
  descriptif: 'Bonjour, je suis Jessica et je recherche un acteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: jessica
)

jessica_post_two.photos.attach(io: URI.open("https://source.unsplash.com/random?cinema"), filename: "jessica_post_two.png", content_type: "image/png")

jessica_post_two.save!

axel_post = Post.new(titre: 'Comédien 25 ans pub réseaux sociaux',
  age: '25-35',
  genre: 'Homme',
  departement: '75',
  date: '2022-10-10',
  descriptif: 'Recherche comédien 25 ans pour vidéos réseaux sociaux (témoignages, avis clients, retours d’expériences).
  Thème : application E SPORT
  Tournage 1 journée / demi journée à Paris le 10 octobre 2022
  Prestation rémunérée au minimum selon le barème syndical
  Merci de joindre une vidéo de présentation de 30 secondes - format selfi vertical + bande démo.
  OBJET : H 25 E SPORT
  Axel Laufer
  (ngagecast@gmail.com)',
  user: axel
)

axel_post.photos.attach(io: URI.open("https://cdn.dribbble.com/users/3269868/screenshots/15178918/media/7efb35d6ed4b1eeaaa5152477f01d9ac.png?"), filename: "axel_post.png", content_type: "image/png")

axel_post.save!

franck_post = Post.new(titre: 'Saison 2 Weekend Family',
  age: '18-90',
  genre: 'Femme',
  departement: '78',
  date: '2022-10-13',
  descriptif: 'Pour la saison 2 de la série Weekend Family, je recherche pour une journée de figuration le jeudi 13 octobre
  une femme enceinte de quelques mois.
  Nous tournons à Maisons-Laffitte dans le 78.
  Nous sommes dans une salle où attendent quelques patientes.
  Le cachet est de 88,56 € + heures supplémentaires si nous en faisons.
  Ne sachant pas à l avance si la journée risque d être longue, je vais privilégier une femme enceinte qui ne sera pas à la limite de son congé maternité.
  Merci d envoyer vos photos à l adresse mail: jouardcasting@icloud.com  en précisant en objet "femme enceinte" en objet.
  D avance merci.
  Franck Jouard',
  user: franck
)

franck_post.photos.attach(io: URI.open("https://img.filmsactu.net/datas/fiches/d/i/disney/xl/disney-6222527c7a4a1.jpg"), filename: "franck_post_two.png", content_type: "image/png")

franck_post.save!

franck_post_two = Post.new(titre: 'Post de Franck 2',
  age: '18-25',
  genre: 'Homme',
  departement: '40',
  date: '2023-01-06',
  descriptif: 'Bonjour, je suis franck et je recherche un recruteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: franck
)

franck_post_two.photos.attach(io: URI.open("https://source.unsplash.com/random?acteur"), filename: "franck_post_two.png", content_type: "image/png")

franck_post_two.save

axel_post_two = Post.new(titre: 'Post d\'Alex 2',
  age: '45-55',
  genre: 'Femme',
  departement: '64',
  date: '2023-02-01',
  descriptif: 'Bonjour, je suis axel et je recherche un recruteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: axel
)

axel_post_two.photos.attach(io: URI.open("https://source.unsplash.com/random?camera"), filename: "axel_post_two.png", content_type: "image/png")

axel_post_two.save

axel_post_three = Post.new(titre: 'Post d\'Alex 3',
  age: '18-90',
  genre: 'Homme',
  departement: '77',
  date: '2022-11-01',
  descriptif: 'Bonjour, je suis axel et je recherche un recruteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: axel
)

axel_post_three.photos.attach(io: URI.open("https://source.unsplash.com/random?film"), filename: "axel_post_three.png", content_type: "image/png")

axel_post_three.save

puts "Post seed finish !"
sleep(1)

puts "------------------------------"
puts "----------Seed end !----------"
puts "------------------------------"

sleep(1)
