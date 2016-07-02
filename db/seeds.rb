# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_names = ["Cyril", "Lukass", "Jakub", "Marketa", "Veronika", "Michal", "Simon"]
last_names = ["Cermak", "Reidinger", "Reiginer", "Dochazkova", "Sadilkova", "Tulach", "Pouba"]
emails = ["cyril.cermak@gmail.com", "reidingerL@fffseznam.cz", "reiginerJ@seznam.cz", "dochazkova@gmail.com", "sav@gmail.com", "tulach@seznam.cz", "simon@gmail.com"]
mac = ["X:2123456", "12345678900", "12348", "1234567", "1234569", "1456789", "1239"]
passwords = ["123456789"]
positions = ["Receptionist", "Programmer", "Technician","Manager", "Accountant", "Visioner", "Designer"]
departments = ["IT","Accounting", "HR","PR","Sales","Development","Headquater"]
i = 0

while i < first_names.length
  #TODO - holidays
  d = Department.create!(name: departments[i], floor: rand(0..7))
  p = Position.create!(name: positions[i], wage: rand(100000..190000), department: d)
  w = Worker.create!(first_name: first_names[i], last_name: last_names[i], password: passwords[0], email: emails[i], mac: mac[i], position: p, state: true )
  9.times do |j|
    TimeTable.create!(start: "2016-0#{j+1}-25 0#{rand 8..9}:00:06", end: "2016-0#{j+1}-25 17:#{25..30}:06", worker: w)
  end
  i += 1
end
