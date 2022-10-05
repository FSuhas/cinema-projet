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
  sexe: :Homme,
  date_de_naissance: '1986.08.13',
  infos: 'Blond grand aux yeux bleus',
  role: ''
)

fabien.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?man"), filename: "fabien.png", content_type: "image/png")

fabien.save!

jean = User.new(email: 'jean@test.com',
  password: 'azerty',
  nom: '',
  prenom: '',
  adresse: '',
  telephone: '',
  sexe: :Homme,
  date_de_naissance: '',
  infos: '',
  role: ''
)

jean.save!

jessica = User.new(email: 'jessica@test.com',
  password: 'azerty',
  nom: '',
  prenom: '',
  adresse: '',
  telephone: '',
  sexe: :Femme,
  date_de_naissance: '',
  infos: '',
  role: ''
)


jessica.save!

axel = User.new(email: 'ngagecast@gmail.com',
  password: 'azerty',
  nom: 'Laufer',
  prenom: 'Axel',
  adresse: 'Paris',
  telephone: '',
  sexe: :Homme,
  date_de_naissance: '',
  infos: 'Chargée de recrutement',
  role: 'recruteur'
)

axel.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?man"), filename: "axel.png", content_type: "image/png")

axel.save!

franck = User.new(email: 'jouardcasting@icloud.com',
  password: 'azerty',
  nom: 'Jouard',
  prenom: 'Franck',
  adresse: '78',
  telephone: '',
  sexe: :Homme,
  date_de_naissance: '',
  infos: 'Chargée de recrutement',
  role: 'recruteur'
)

franck.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?boy"), filename: "franck.png", content_type: "image/png")

franck.save!

lael = User.new(email: 'lael@test.com',
  password: 'azerty',
  nom: 'Bolle Suhas',
  prenom: 'Laël',
  adresse: '3 rue winston chruchill 77100 Meaux',
  telephone: '06.23.16.20.02',
  sexe: :Homme,
  date_de_naissance: '2016-01-18',
  infos: 'Beau petit garçon',
  role: 'candidat'
)

lael.photo.attach(io: URI.open("https://source.unsplash.com/random?profile?"), filename: "lael.png", content_type: "image/png")

lael.save!

noevan = User.new(email: 'noevan@test.com',
  password: 'azerty',
  nom: 'Bolle Suhas',
  prenom: 'Noëvan',
  adresse: '3 rue winston chruchill 77100 Meaux',
  telephone: '06.23.16.20.02',
  sexe: :Homme,
  date_de_naissance: '2020-10-04',
  infos: 'Il est pas grand mais il est costaud',
  role: 'candidat'
)

noevan.photo.attach(io: URI.open("https://source.unsplash.com/random?man"), filename: "noevan.png", content_type: "image/png")

noevan.save!

puts "user seed finish !"
sleep(1)
puts "Post seed start..."

jessica_post = Post.new(titre: 'Post de Jessica',
  role: 'Figurant',
  age: '18-25',
  genre: 'Homme',
  ville: 'Paris',
  departement: '75',
  lieux: 'Paris',
  date: '2022-01-12',
  descriptif: 'Bonjour, je suis Jessica et je recherche un acteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: jessica
)

jessica_post.photos.attach(io: URI.open("https://source.unsplash.com/random?actrice"), filename: "jessica_post.png", content_type: "image/png")

jessica_post.save!

jessica_post_two = Post.new(titre: 'Post de Jessica 2',
  role: 'Doublure',
  age: '25-35',
  genre: 'Femme',
  ville: 'Meaux',
  departement: '77',
  lieux: 'Meaux',
  date: '2023-01-01',
  descriptif: 'Bonjour, je suis Jessica et je recherche un acteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: jessica
)

jessica_post_two.photos.attach(io: URI.open("https://source.unsplash.com/random?cinema"), filename: "jessica_post_two.png", content_type: "image/png")

jessica_post_two.save!

axel_post = Post.new(titre: 'Comédien 25 ans pub réseaux sociaux',
  role: 'Rôle',
  age: '25-35',
  genre: 'Homme',
  ville: 'Paris',
  departement: '75',
  lieux: 'Paris',
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

franck_post_two = Post.new(titre: 'Saison 2 Weekend Family',
  role: 'Figurant',
  age: '18-90',
  genre: 'Femme',
  ville: '',
  departement: '78',
  lieux: '',
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

franck_post_two.photos.attach(io: URI.open("https://img.filmsactu.net/datas/fiches/d/i/disney/xl/disney-6222527c7a4a1.jpg"), filename: "franck_post_two.png", content_type: "image/png")

franck_post_two.save!

lael_post = Post.new(titre: 'Post de Lael',
  role: 'Figurant',
  age: '18-25',
  genre: 'Homme',
  departement: '40',
  date: '2023-01-06',
  descriptif: 'Bonjour, je suis Lael et je recherche un recruteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: lael
)

lael_post.photos.attach(io: URI.open("https://source.unsplash.com/random?acteur"), filename: "lael_post.png", content_type: "image/png")

lael_post.save

lael_post_two = Post.new(titre: 'Post de Lael 2',
  role: 'Silhouette',
  age: '45-55',
  genre: 'Femme',
  ville: 'Bayonne',
  date: '2023-02-01',
  descriptif: 'Bonjour, je suis Lael et je recherche un recruteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: lael
)

lael_post_two.photos.attach(io: URI.open("https://source.unsplash.com/random?camera"), filename: "lael_post_two.png", content_type: "image/png")

lael_post_two.save

noevan_post = Post.new(titre: 'Post de Noëvan',
  role: 'Doublure',
  age: '18-90',
  genre: 'Homme',
  ville: 'Lagny sur Marne',
  date: '2022-11-01',
  descriptif: 'Bonjour, je suis Noëvan et je recherche un recruteur pour un court-métrage. Merci de me contacter pour plus d\'informations.',
  user: noevan
)

noevan_post.photos.attach(io: URI.open("https://source.unsplash.com/random?film"), filename: "noevan_post.png", content_type: "image/png")

noevan_post.save

puts "Post seed finish !"
sleep(1)

puts "------------------------------"
puts "----------Seed end !----------"
puts "------------------------------"

sleep(1)
