# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Doctor.create(:email => 'doc@foo.com', :password => 'test1234', :password_confirmation => 'test1234') if Doctor.where(:email => 'doc@foo.com').count == 0

Patient.create(:email => 'pat@foo.com', :password => 'test1234', :password_confirmation => 'test1234') if Patient.where(:email => 'pat@foo.com').count == 0
