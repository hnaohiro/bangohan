# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create name: 'hiroyuki', hour: 20, min: 30, defined: true, need: true, order: 1
User.create name: 'teruyo', hour: 20, min: 0, defined: true, need: true, order: 2
User.create name: 'naohiro', hour: 0, min: 0, defined: true, need: false, order: 3
User.create name: 'sadako', hour: 0, min: 0, defined: false, need: true, order: 4
