# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
School.create([
  { name: "Algoma University" },
  { name: "Brescia University College" },
  { name: "Brock University" },
  { name: "Carleton University" },
  { name: "Dominican College of Philosophy and Theology" },
  { name: "Huron University College" },
  { name: "King’s University College" },
  { name: "Lakehead University" },
  { name: "Laurentian University of Sudbury" },
  { name: "McMaster University" },
  { name: "Nipissing University" },
  { name: "OCAD University" },
  { name: "Queen’s University" },
  { name: "Redeemer University College" },
  { name: "Royal Military College of Canada" },
  { name: "Ryerson University" },
  { name: "Saint Paul University" },
  { name: "St. Jerome’s University" },
  { name: "Trent University" },
  { name: "University of Guelph" },
  { name: "University of Ontario Institute of Technology" },
  { name: "University of Ottawa" },
  { name: "University of St. Michael’s College" },
  { name: "University of Sudbury" },
  { name: "University of Toronto" },
  { name: "University of Trinity College" },
  { name: "University of Waterloo" },
  { name: "University of Windsor" },
  { name: "Victoria University" },
  { name: "Western University" },
  { name: "Wilfrid Laurier University" },
  { name: "York University" }
])

Major.create([
  { name: "Chemical Engineering" },
  { name: "Civil Engineering" },
  { name: "Computer Engineering" },
  { name: "Electrical Engineering" },
  { name: "Systems Engineering" },
  { name: "Materials Engineering" },
  { name: "Mechanical Engineering" },
  { name: "Mineral Engineering" },
  { name: "Engineering Science" },
  { name: "Electrical and Computer Engineering" },
  { name: "Architectural Studies" },
  { name: "Visual Studies" },
  { name: "Computer Science" },
  { name: "Humanities" },
  { name: "Life Sciences" },
  { name: "Physical and Mathematical Sciences" },
  { name: "Rotman Commerce" },
  { name: "Social Science" },
  { name: "Physical and Health Education" },
  { name: "Kinesiology" },
  { name: "Artists Diploma" },
  { name: "Composition" },
  { name: "Comprehensive" },
  { name: "History & Theory" },
  { name: "Music Education" },
  { name: "Performance" }
])

a = Account.create!(name: "student", email: "student@example.com", password: "qwertyuiop", username: "test-student")
a.student = Student.new(major_id: Major.first, school_id: School.first)
a.save

a = Account.create!(name: "employer", email: "employer@example.com", password: "qwertyuiop", username: "test-employer")
a.employer = Employer.new
a.save
