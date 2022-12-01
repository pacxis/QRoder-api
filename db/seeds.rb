# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(email: 'table1@qroder.com', password: 'testtest', password_confirmation: 'testtest',id: 1, role: "customer") 
User.create!(email: 'table2@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 2, role: "customer") 
User.create!(email: 'table3@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 3, role: "customer") 
User.create!(email: 'table4@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 4, role: "customer") 
User.create!(email: 'table5@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 5, role: "customer") 
User.create!(email: 'table6@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 6, role: "customer") 
User.create!(email: 'table7@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 7, role: "customer") 
User.create!(email: 'table8@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 8, role: "customer") 
User.create!(email: 'table9@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 9, role: "customer") 
User.create!(email: 'table10@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 10, role: "customer") 
User.create!(email: 'table11@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 11, role: "customer") 
User.create!(email: 'table12@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 12, role: "customer") 

CustSession.create!(user_id: 1,id: 1, table: 1, tell: "0423456789") 
CustSession.create!(user_id: 2,id: 2, table: 2, tell: "0423456789") 
CustSession.create!(user_id: 3,id: 3, table: 3, tell: "0423456789") 
CustSession.create!(user_id: 4,id: 4, table: 4, tell: "0423456789") 
CustSession.create!(user_id: 5,id: 5, table: 5, tell: "0423456789") 
CustSession.create!(user_id: 6,id: 6, table: 6, tell: "0423456789") 
CustSession.create!(user_id: 7,id: 7, table: 7, tell: "0423456789") 
CustSession.create!(user_id: 8,id: 8, table: 8, tell: "0423456789") 
CustSession.create!(user_id: 9,id: 9, table: 9, tell: "0423456789") 
CustSession.create!(user_id: 10,id: 10, table: 10, tell: "0423456789") 
CustSession.create!(user_id: 11,id: 11, table: 11, tell: "0423456789") 
CustSession.create!(user_id: 12,id: 12, table: 12, tell: "0423456789") 





User.create!(email: 'emp1@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 13, role: "employee") 
User.create!(email: 'emp2@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 14, role: "employee") 
User.create!(email: 'emp3@qroder.com', password: 'testtest', password_confirmation: 'testtest' ,id: 15, role: "employee") 