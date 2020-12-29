50.times do |n|
  name = Faker::Artist.name
  email = Faker::Internet.unique.email
  password = "password"
  image = "image.png"
  User.create!(name: name,
               email: email,
               password_digest: password,
               image: image,
               )
end
