# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = Post.create(title: "title1",description:"description1", status: 1, create_user_id: 1, update_user_id: 1)
User.create!([{
  name: "Thu Thu",
  profile: 'download.png',
  email: "thuthu@gmail.com",
  password: "aaaaaaaa",
  role: '0',
  phone: '09251047256',
  address: 'Insein',
  dob: '2022-06-01',
  create_user_id: 1,
  update_user_id: 1,
},])
