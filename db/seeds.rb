# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create!(name:'Jiya', email:'Jiya@gmail.com', password:'Jiya123')
second_user = User.create!(name:'siya', email:'Siya@gmail.com', password:'siya123')
third_user = User.create!(name:'brenda', email:'brenda@gmail.com', password:'brenda123')
fourth_user = User.create!(name:'brian', email:'brian@gmail.com', password:'brian123')
fifth_user = User.create!(name:'antoney', email:'antoney@gmail.com', password:'antoney123')


puts 'Doctors seeding .....'

first_doctor = Doctor.create!(user_id: first_user.id, name: 'Dr Lovi', bio: 'Gynaecology', image: 'https://tse3.mm.bing.net/th?id=OIP.IVwf85npYYUcwRp4EIhqDgHaJm&pid=Api&P=0&h=180')
second_doctor = Doctor.create!(user_id: second_user.id, name: 'Dr Pari', bio: 'Surgeon', image: 'https://tse3.mm.bing.net/th?id=OIP.rzvJIIoK4rs7kpN44Q5YegHaE8&pid=Api&P=0&h=180')
third_doctor = Doctor.create!(user_id: second_user.id, name: 'Dr Mohsen', bio: 'Psychologist', image: 'https://tse3.mm.bing.net/th?id=OIP.M0FZeVMZa_n7zHGbAcJF1wHaFj&pid=Api&P=0&h=180')
fourth_doctor = Doctor.create!(user_id: third_user.id, name: 'Dr Louisa', bio: 'Dentist', image: 'https://static.facegfx.com/2013/sweet-smiling-female-doctor-image-download_247526736.jpg')
fifth_doctor = Doctor.create!(user_id: fourth_user.id, name: 'Dr Edmund', bio: 'Optometrist', image: 'https://cdn.wallpapersafari.com/87/12/8XzqUv.jpg')

first_appointment = Appointment.create!(user_id: first_user.id, doctor_id: first_doctor.id, city: "Accra", date: "2022-12-12")


puts 'Created successful ...'
