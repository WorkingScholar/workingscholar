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

Department.create([
  { name: "Agricultural and Environmental Sciences" },
  { name: "Applied Science and Engineering" },
  { name: "Architecture, Landscape, and Design" },
  { name: "Arts" },
  { name: "Dentistry" },
  { name: "Forestry" },
  { name: "Information" },
  { name: "Kinesiology and Physical Education" },
  { name: "Law" },
  { name: "Management" },
  { name: "Medicine" },
  { name: "Music" },
  { name: "Nursing" },
  { name: "Pharmacy" },
  { name: "Religious Studies" },
  { name: "Science" }
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
  { name: "Marketing" },
  { name: "Finance" },
  { name: "Accounting" },
  { name: "Economics" },
  { name: "General Management" },
  { name: "Operations Management" },
  { name: "Industrial Relations" },
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

a = Account.create!(name: "Bob Smith",
                    email: "bob@example.com",
                    password: "qwertyuiop",
                    username: "bob_smith")
a.student = Student.new(major_id: Major.where(name: "Marketing"),
                        school_id: School.where(name: "McGill University"),
                        department_id: Department.where(name: "Management"))
a.save

a = Account.create!(name: "Jim Ryan",
                    email: "jim@example.com",
                    password: "qwertyuiop",
                    username: "jim_ryan")
a.student = Student.new(major_id: Major.where(name: "Mechanical Engineering"),
                        school_id: School.where(name: "University of Toronto"),
                        department_id: Department.where(name: "Applied Science and Engineering"))
a.save

a = Account.create!(name: "ABC Marketing Agency",
                    email: "abc-marketing@example.com",
                    password: "qwertyuiop",
                    username: "abc_marketing")
employer_one = Employer.new(contact_email: "abc-contact@example.com")
a.employer = employer_one
a.save

a = Account.create!(name: "Timber Construction Company",
                    email: "timber_construction@example.com",
                    password: "qwertyuiop",
                    username: "timber_construction")
employer_two = Employer.new(contact_email: "timber-contact@example.com")
a.employer = employer_two
a.save

Posting.create!(title: "Marketing Assistant",
                description: "Updates competitor database by inputting data from field sales;
                                  compiling, consolidating, formatting, and summarizing information,
                                  graphs, and presentations; distributing reports.",
                compensation: "PAY",
                duration: 2,
                employer: employer_one)
