# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AgeGroup.destroy_all
ProgramType.destroy_all
Organization.destroy_all
Program.destroy_all

ProgramType.create([
{name: 'Arts & Culture'},
{name: 'Parent & Child'},
{name: 'Childcare & Preschools'},
{name: 'Sports'},
{name: 'Child Care'},
{name: 'Community Clubs'},
{name: 'Education'}
])
#
AgeGroup.create([
{age: '0-5'},
{age: '6-12'},
{age: 'All Ages'},
])

# Program 2 from Excel
Organization.create(
age_group: AgeGroup.find_by(age: '0-5'),
description: '',
name: 'Clarion Highland Dance Studio',
address: '',
phone: '',
website: 'www.clarioncreations.ca',
 )
Program.create(
age_group: AgeGroup.find_by(age: '0-5'),
program_type: ProgramType.find_by(name: 'Arts & Culture'),
organization: Organization.find_by(name: 'Clarion Highland Dance Studio'),
description: 'Highland Dancing',
registration: 'Registered',
cost: 'Paid'
)
# Program 10 from Excel
Organization.create(
 age_group: AgeGroup.find_by(age: '0-5'),
 description: '',
 name: 'Ladner Pioneer Library',
 address: '4683 - 51st Street Delta, BC V4K 2V8',
 phone: '(604) 946-6215',
 website: 'https://fvrl.bibliocommons.com/locations/LD',
  )
Program.create(
age_group: AgeGroup.find_by(age: '0-5'),
program_type: ProgramType.find_by(name: 'Education'),
organization: Organization.find_by(name: 'Ladner Pioneer Library'),
description: 'Babytime, Storytime, Parent Child Mother Goose',
registration: 'Drop In',
cost: 'Free'
)
# Program 18 from Excel
Organization.create(
 age_group: AgeGroup.find_by(age: '0-5'),
 description: '',
 name: 'Reach Child & Youth Development Society',
 address: '3-3800 72nd Street, Ladner',
 phone: '604-946-6622 ext 308',
 website: 'http://reachdevelopment.org/reach-developmental-preschool-south-delta.html',
  )
Program.create(
age_group: AgeGroup.find_by(age: '0-5'),
program_type: ProgramType.find_by(name: 'Childcare & Preschools'),
organization: Organization.find_by(name: 'Reach Child & Youth Development Society'),
description: 'Reach Developmental Preschool South Delta',
registration: 'Registered',
cost: 'Paid'
)
# Program 36 from Excel
Organization.create(
 age_group: AgeGroup.find_by(age: '6-12'),
 description: '',
 name: 'Childcare Resource Referral',
 address: '',
 phone: '',
 website: 'http://www.options.bc.ca/',
  )
Program.create(
age_group: AgeGroup.find_by(age: '6-12'),
program_type: ProgramType.find_by(name: 'Child Care'),
organization: Organization.find_by(name: 'Childcare Resource Referral'),
description: 'Listing of before and after school care providers',
registration: 'Registered',
cost: 'Paid'
)
# Program 22 from Excel
Organization.create(
age_group: AgeGroup.find_by(age: '0-5'),
description: '',
name: 'Tsawwassen First Nation',
address: '1926 Tsawwassen Dr N, Delta, BC',
phone: '604-943-1322 ext 224',
website: 'http://tsawwassenfirstnation.com/programs-and-services/smuyuqwa-lelum-ecd-centre/',
 )
Program.create(
age_group: AgeGroup.find_by(age: '0-5'),
program_type: ProgramType.find_by(name: 'Childcare & Preschools'),
organization: Organization.find_by(name: 'Tsawwassen First Nation'),
description: 'Smuyuq’wa’ Lelum Early Childhood Development Centre is a fully licensed, state of the art, childcare facility, providing quality care for children aged 6 months to 6 years.',
registration: 'Registered',
cost: 'Paid'
)
# Program 47 from Excel
Organization.create(
age_group: AgeGroup.find_by(age: '6-12'),
description: '',
name: 'Navy League',
address: '',
phone: '',
website: 'http://www.navyleague.ca/eng/',
 )
 Program.create(
 age_group: AgeGroup.find_by(age: '6-12'),
 program_type: ProgramType.find_by(name: 'Community Clubs'),
 organization: Organization.find_by(name: 'Navy League'),
 description: 'Leadership, sailing, camping, first aid, drilling',
 registration: 'Registered',
 cost: 'Paid'
 )
