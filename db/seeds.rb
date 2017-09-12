AgeGroup.destroy_all
ProgramType.destroy_all
ServiceType.destroy_all
Category.destroy_all
Organization.destroy_all
Program.destroy_all

Topic.destroy_all
Service.destroy_all
User.destroy_all

PASSWORD = '123'

User.create([
  {first_name: 'Hung',
   last_name: 'H.',
   email: 'hh@nowayjose.com',
   password: PASSWORD,
   is_admin: false,
   phone: '4u'},
  {first_name: 'Jesse',
   last_name: 'J.',
   email: 'jj@nowayjose.com',
   password: PASSWORD,
   is_admin: false,
   phone: '4u'},
  {first_name: 'Dylan',
   last_name: 'D.',
   email: 'dd@nowayjose.com',
   password: PASSWORD,
   is_admin: false,
   phone: '4u'},
  {first_name: 'Ruby',
   last_name: 'R.',
   email: 'rr@nowayjose.com',
   password: PASSWORD,
   is_admin: false,
   phone: '4u'},
  {first_name: 'Hano',
   last_name: 'H.',
   email: 'ha@nowayjose.com',
   password: PASSWORD,
   is_admin: false,
   phone: '4u'},
  {first_name: 'Chris',
   last_name: 'C',
   email: 'ctest@test.ca',
   password: PASSWORD,
   is_admin: true,
   phone: '4u'},
  {first_name: 'Carlo',
   last_name: 'C.',
   email: 'ca@nowayjose.com',
   password: PASSWORD,
   is_admin: false,
   phone: '4u'},
  {first_name: 'José',
   last_name: 'G.',
   email: 'jg@nowayjose.com',
   password: PASSWORD,
   is_admin: true,
   phone: '4u'},
   {first_name: 'Tam',
    last_name: 'K',
    email: 'tam@codecore.com',
    password: PASSWORD,
    is_admin: true,
    phone: '4u'}
  ])


Topic.create(
[
  {name: 'Physical Health'},
  {name: 'Mental Health'},
  {name: 'Child Development'},
  {name: 'Policy'},
  {name: 'Child Safety'},
  {name: 'Other (specify in tags)'}
  ])

ServiceType.create([
{name: 'Child Advocacy'},
{name: 'Arts & Culture'},
{name: 'Health & Development'},
{name: 'Help in a Crisis'},
{name: 'Supports for Children'},
{name: 'Assistance with fees'},
{name: 'Childcare & Preschool'},
{name: 'Supports for families'},
{name: 'Health & Development'}
])

cost = ['Paid', 'Free']
registration = ['Registered', 'Drop In']

Category.create([
{name: 'Children'},
{name: 'Families'},
{name: 'Pregnancy & Babies'}
])

ProgramType.create([
{name: 'Arts & Culture'},
{name: 'Parent & Child'},
{name: 'Childcare & Preschools'},
{name: 'Sports'},
{name: 'Community Clubs'},
{name: 'Education'}
])

AgeGroup.create([
{age: '0-5'},
{age: '6-12'},
{age: 'Adults'},
{age: 'All Ages'}
])


require 'csv'

csv_text = File.read(Rails.root.join('db', 'programs_with_agencies_sheet1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  Organization.create(
   description: '',
   name: row['Agencies'],
   address: row['Address'],
   phone: row['Phone Number'],
   website: row['Website'],
  )

  Program.create(
  program_type: ProgramType.find_by(name:row['Programs']),
  organization: Organization.find_by(name:row['Agencies']),
  description: row['Short Description that relate to program'],
  registration: row['Registration'],
  cost: row['Cost']
  )
  ProgramAgeGroup.create(
  program: Program.find_by(description: row['Short Description that relate to program']),
  age_group: AgeGroup.find_by(age: row['Age Group']),
  )

end

puts "There are now #{Program.count} rows in the program table and #{Organization.count} rows in the organization table"

csv_text = File.read(Rails.root.join('db', 'services_with_agencies_sheet1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  Organization.create(
   description: '',
   name: row['Agency'],
   address: row['Address'],
   phone: row['Phone Number'],
   website: row['Website'],
  )
  Service.create(
  service_type: ServiceType.find_by(name: row['Service']),
  organization: Organization.find_by(name: row['Agency']),
  category: Category.find_by(name: row['Category']),
  description: row['Description that relate to service']
  )

  Tag.create(
    name: row['Tags'],
  )

end

puts "There are now #{Service.count} rows in the Service table and #{Tag.count} rows in the Tag table and  #{Organization.count} rows in the organization table"
# Organization.create(
#  description: '',
#  name: 'Reach Child & Youth Development Society',
#  address: '3-3800 72nd Street, Ladner',
#  phone: '604-946-6622 ext 308',
#  website: 'http://reachdevelopment.org/reach-developmental-preschool-south-delta.html',
# )
# #
# Program.create(
# program_type: ProgramType.find_by(name: 'Childcare & Preschools'),
# organization: Organization.find_by(name: 'Reach Child & Youth Development Society'),
# description: 'Reach Developmental Preschool South Delta',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Reach Developmental Preschool South Delta',),
# age_group: AgeGroup.find_by(age: '0-5')
# )
#
# # Program 36 from Excel
# Organization.create(
#  description: '',
#  name: 'Childcare Resource Referral',
#  address: '',
#  phone: '',
#  website: 'http://www.options.bc.ca/',
#   )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Child Care'),
# organization: Organization.find_by(name: 'Childcare Resource Referral'),
# description: 'Listing of before and after school care providers',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Listing of before and after school care providers'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
# # Program 22 from Excel
# Organization.create(
# description: '',
# name: 'Tsawwassen First Nation',
# address: '1926 Tsawwassen Dr N, Delta, BC',
# phone: '604-943-1322 ext 224',
# website: 'http://tsawwassenfirstnation.com/programs-and-services/smuyuqwa-lelum-ecd-centre/',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Childcare & Preschools'),
# organization: Organization.find_by(name: 'Tsawwassen First Nation'),
# description: 'Smuyuq’wa’ Lelum Early Childhood Development Centre is a fully licensed, state of the art, childcare facility, providing quality care for children aged 6 months to 6 years.',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Smuyuq’wa’ Lelum Early Childhood Development Centre is a fully licensed, state of the art, childcare facility, providing quality care for children aged 6 months to 6 years.'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
# # Program 47 from Excel
# Organization.create(
# description: '',
# name: 'Navy League',
# address: '',
# phone: '',
# website: 'http://www.navyleague.ca/eng/',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Community Clubs'),
# organization: Organization.find_by(name: 'Navy League'),
# description: 'Leadership, sailing, camping, first aid, drilling',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Leadership, sailing, camping, first aid, drilling'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
# # Program 103 from Excel
# Organization.create(
# name: 'Special Olympics',
# phone: '',
# address: '',
# website: 'www.socdelta.org',
# description: ''
# )
# Program.create(
# program_type: ProgramType.find_by(name: 'Sports'),
# organization: Organization.find_by(name: 'Special Olympics'),
# description: 'Basketball, Bowling, Curling, Floor Hockey, Rhythmic Gymnastics, Alpine Skiing, Swimming, Soccer, Softball, Track and Field, Golf',
# registration: 'Registered',
# cost: 'Paid'
# )
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Basketball, Bowling, Curling, Floor Hockey, Rhythmic Gymnastics, Alpine Skiing, Swimming, Soccer, Softball, Track and Field, Golf'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
#
# # Program 2 from Excel
# Organization.create(
# description: '',
# name: 'Deas Island Dance',
# address: '270-6165 Hwy 17A Delta,
# BC, V4K 5B8',
# phone: '604-946-5867',
# website: 'www.deasislanddance.com',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Deas Island Dance'),
# description: 'Ballet, Modern, Jazz, Lyrical Jazz, Hip Hop, Tap',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Ballet, Modern, Jazz, Lyrical Jazz, Hip Hop, Tap'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Ballet, Modern, Jazz, Lyrical Jazz, Hip Hop, Tap'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # Program 4 from Excel
# Organization.create(
# description: '',
# name: 'Studio West',
# address: '2nd Floor, 4866 Delta Street
# Ladner, B.C.  V4K 2T8',
# phone: '604-940-9953',
# website: 'http://www.studiowestdance.ca/',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Studio West'),
# description: 'Ballet, Jazz, Tap, Hip Hop, Musical Theatre, Lyrical, Contemporary',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Ballet, Jazz, Tap, Hip Hop, Musical Theatre, Lyrical, Contemporary'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Ballet, Jazz, Tap, Hip Hop, Musical Theatre, Lyrical, Contemporary'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
#
#
# # Program 6 from Excel
# Organization.create(
# description: '',
# name: 'Burns Bog Conservation Society',
# address: '4-7953 120th Street
# Delta, BC V4C 6P6',
# phone: '604.572.0373',
# website: 'www.burnsbog.org',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Burns Bog Conservation Society'),
# description: 'Nature classes, workshops, special events as well as tours of Burns Bog',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Nature classes, workshops, special events as well as tours of Burns Bog'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # Program 7 from Excel
# Organization.create(
# description: '',
# name: 'Delta Community Music School',
# address: '4705 Arthur Drive
# Delta, BC V4K 2X5',
# phone: '604-946-1280',
# website: 'www.dcms.ca',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Community Music School'),
# description: 'Music',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'music'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
#
# # Program 8 from Excel
# Organization.create(
# description: '',
# name: 'Free Flight Dance',
# address: '4942 Chisholm Street, Delta BC, V4K 3X2',
# phone: '604-946-8586',
# website: 'www.freeflightdance.com',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Free Flight Dance'),
# description: 'It is an award winning academy whose owner is fully accredited with the Royal Academy of Dance. Classes for 3-5 years old',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'music'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
#
# # Program 9 from Excel
# Organization.create(
# description: '',
# name: 'Free Flight Dance',
# address: '4942 Chisholm Street, Delta BC, V4K 3X2',
# phone: '604-946-8586',
# website: 'www.freeflightdance.com',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Free Flight Dance'),
# description: 'It is an award winning academy whose owner is fully accredited with the Royal Academy of Dance. It excels in providing general and elite training in Ballet (including Royal Academy of Dance examination preparation to the Advance 2 level), Jazz, Tap, Hip Hop, Contemporary, Lyrical, Musical Theatre, Stage, Flamenco, and Acro.',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'music'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # Program 10/11 from Excel
# Organization.create(
# description: '',
# name: 'Surrey Arts Umbrella',
# address: '4942 Chisholm Street, Delta BC, V4K 3X2',
# phone: '604-535-1127',
# website: '
# www.artsumbrella.com/surrey
# ',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Surrey Arts Umbrella'),
# description: 'Visual Arts, Dance, Theatre, Music, and Media',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Visual Arts, Dance, Theatre, Music, and Media'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Visual Arts, Dance, Theatre, Music, and Media'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # Program 12 from Excel
# Organization.create(
# description: '',
# name: 'Nurturing Nature',
# address: '',
# phone: '778-999-4175',
# website: '
# www.nurturingnature.weebly.com
# ',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Nurturing Nature'),
# description: 'Nature classes',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Nature classes'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # Program 13 from Excel
# Organization.create(
# description: '',
# name: 'Delta Parks & Recreation - Harris Barn',
# address: 'Harris Barn, 4140 Arthur Dr, Delta, BC V4K 1A7',
# phone: '',
# website: '
# http://www.delta.ca/parks-recreation/activity-search
# ',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - Harris Barn'),
# description: 'Various, such as: Dance, Music, Parent & Tot, Playtime, Reading',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Dance, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
#
# # From 14 Program Excel
#
# Organization.create(
# description: '',
# name: 'Delta Parks & Recreation - Ladner Community Centre',
# address: 'Ladner Community Centre,4734 51 Street, Delta, BC V4K 3R8',
# phone: '604-946-9226',
# website: '
# http://www.delta.ca/parks-recreation/activity-search
# ',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - Ladner'),
# description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
#
# # From 15 Program Excel
# Organization.create(
# description: '',
# name: 'Delta Parks & Recreation - North Delta Recreation Centre',
# address: 'North Delta Recreation Centre, 11415 84 Avenue, Delta, BC V4C 2L9',
# phone: '604-952-3045',
# website: '
# http://www.delta.ca/parks-recreation/activity-search
# ',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - North Delta Recreation Centre'),
# description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
#
# # From 16 Program Excel
# Organization.create(
# description: '',
# name: 'Delta Parks & Recreation - South Delta Recreation Centre',
# address: 'South Delta Recreation Centre, 1720 56 Street, Delta, BC V4L 2B1',
# phone: '604-952-3020',
# website: '
# http://www.delta.ca/parks-recreation/activity-search
# ',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - South Delta Recreation Centre'),
# description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
#
# # From 17 Program Excel
# Organization.create(
# description: '',
# name: 'Delta Parks & Recreation - Tsawwassen Arts Centre',
# address: 'Tsawwassen Arts Centre, 1172 56 Street, Delta, BC V4L 2A3',
# phone: '604-943-9437',
# website: '
# http://www.delta.ca/parks-recreation/activity-search
# ',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - Tsawwassen Arts Centre'),
# description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '0-5'),
# )
#
# # From 18 Program Excel
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - Harris Barn'),
# description: 'May Include: Acting, Art, Baking, Ballet, Cooking, Dance, Drama, Drawing, Guitar, Lego, Magic, Painting, Piano, Pottery, Science, Sewing, Singing, Storytelling, Theatre, Zumba',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # From 19 Program Excel
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - North Delta Recreation Centre'),
# description: 'May Include: Acting, Art, Baking, Ballet, Cooking, Dance, Drama, Drawing, Guitar, Lego, Magic, Painting, Piano, Pottery, Science, Sewing, Singing, Storytelling, Theatre, Zumba',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # From 20 Program Excel
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - South Delta Recreation Centre'),
# description: 'May Include: Acting, Art, Baking, Ballet, Cooking, Dance, Drama, Drawing, Guitar, Lego, Magic, Painting, Piano, Pottery, Science, Sewing, Singing, Storytelling, Theatre, Zumba',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
# # From 21 Program Excel
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - Tsawwassen Arts Centre'),
# description: 'May Include: Acting, Art, Baking, Ballet, Cooking, Dance, Drama, Drawing, Guitar, Lego, Magic, Painting, Piano, Pottery, Science, Sewing, Singing, Storytelling, Theatre, Zumba',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # From 22 Program Excel
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - Ladner Community Centre'),
# description: 'May Include: Acting, Art, Baking, Ballet, Cooking, Dance, Drama, Drawing, Guitar, Lego, Magic, Painting, Piano, Pottery, Science, Sewing, Singing, Storytelling, Theatre, Zumba',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # From 23 Program Excel
#
# Organization.create(
# description: '',
# name: 'Delta Parks & Recreation - Sungod Recreation Centre',
# address: 'Sungod Recreation Centre, 7815 112 Street, Delta, BC V4C 4V9',
# phone: '604-952-3075',
# website: '
# http://www.delta.ca/parks-recreation/activity-search
# ',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Delta Parks & Recreation - Sungod Recreation Centre'),
# description: 'May Include: Acting, Art, Baking, Ballet, Cooking, Dance, Drama, Drawing, Guitar, Lego, Magic, Painting, Piano, Pottery, Science, Sewing, Singing, Storytelling, Theatre, Zumba',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Various, such as: Acting, Birthday Parties, Cooking, Dance, Nature classes, Music, Parent & Tot, Playtime, Reading'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
# # From 24 Program Excel
#
# Organization.create(
# description: '',
# name: 'Boys & Girls Club of the South Coast',
# address: '11339-84th Ave., North Delta V4C 2L9',
# phone: '604.596.9595',
# website: '
# https://www.bgcbc.ca/what-we-do/clubs/hillside-club/
# ',
#  )
#
# Program.create(
# program_type: ProgramType.find_by(name: 'Arts & Culture'),
# organization: Organization.find_by(name: 'Boys & Girls Club of the South Coast'),
# description: 'Hillside Club: To kids, their Club feels like a place where they can hang out with their friends, and make new ones! But it’s so much more. It’s a safe place that provides them with three of the things they need most: a sense of belonging, a sense of success, and positive relationships. That happens through a wide range of activities that are not only of interest to kids, but that are good for them, too: sports, homework, safe access to the on-line world, arts, crafts, and of course, sharing meals.',
# registration: 'Registered',
# cost: 'Paid'
# )
#
# ProgramAgeGroup.create(
# program: Program.find_by(description: 'Hillside Club: To kids, their Club feels like a place where they can hang out with their friends, and make new ones! But it’s so much more. It’s a safe place that provides them with three of the things they need most: a sense of belonging, a sense of success, and positive relationships. That happens through a wide range of activities that are not only of interest to kids, but that are good for them, too: sports, homework, safe access to the on-line world, arts, crafts, and of course, sharing meals.'),
# age_group: AgeGroup.find_by(age: '6-12'),
# )
#
#
# # Services Below
#
#
# # Service 2 from Excel
# Organization.create(
# name: 'Reporting child abuse',
# phone: '1-800-663-9122',
# address: '',
# website: 'http://www2.gov.bc.ca/gov/content/safety/public-safety/protecting-children/keeping-kids-safe',
# description: ''
# )
# Service.create(
# service_type: ServiceType.find_by(name: 'Child Advocacy'),
# organization: Organization.find_by(name: 'Reporting child abuse'),
# category: Category.find_by(name: 'Children'),
# description: 'If you think a child or youth under 19 years of age is being abused or neglected, you have the legal duty to report your concern'
# )
# # Service 29 from Excel
# Organization.create(
# name: 'Child Care Resource & Referral Program (CCRR)',
# phone: '604-572-8032',
# address: '',
# website: 'http://www.childcareoptions.ca/',
# description: ''
# )
# Service.create(
# service_type: ServiceType.find_by(name: 'Assistance with fees'),
# organization: Organization.find_by(name: 'Child Care Resource & Referral Program (CCRR)'),
# category: Category.find_by(name: 'Families'),
# description: 'Information about eligibility and rates for child care subsidies.'
# )
# # Service 49 from Excel
# Organization.create(
# name: 'Fraser Health',
# phone: '604-507-5400',
# address: '',
# website: 'http://www.fraserhealth.ca/health-info/pregnancy-and-babies/',
# description: ''
# )
# Service.create(
# service_type: ServiceType.find_by(name: 'Health & Development'),
# organization: Organization.find_by(name: 'Fraser Health'),
# category: Category.find_by(name: 'Pregnancy & Babies'),
# description: 'Health program and information for pregnant moms and infants.'
# )
# # Service 45 from Excel
# Organization.create(
# name: 'Family Support Institute',
# phone: '1-800-441-5403',
# address: '227 6th Street New Westminster, BC V3L 3A5',
# website: 'https://familysupportbc.com/',
# description: ''
# )
# Service.create(
# service_type: ServiceType.find_by(name: 'Supports for families'),
# organization: Organization.find_by(name: 'Family Support Institute'),
# category: Category.find_by(name: 'Families'),
# description: 'Peer support network for parents who have children with physical and mental extra support needs.'
# )
# # Service 27 from Excel
# Organization.create(
# name: 'Boys and Girls Club South Coast BC',
# phone: '604-591-9262',
# address: '3rd Floor, 11861 88th Avenue, Delta, BC, V4C 3C6',
# website: 'https://www.bgcbc.ca/',
# description: ''
# )
# Service.create(
# service_type: ServiceType.find_by(name: 'Assistance with fees'),
# organization: Organization.find_by(name: 'Boys and Girls Club South Coast BC'),
# category: Category.find_by(name: 'Families'),
# description: 'Financial subsidies for summer camp and after school programs.'
# )
#
# # Service 15 from Excel
# Organization.create(
# name: 'Autism Community Training (ACT)',
# phone: '604-205-5467',
# address: '2250 Boundary Rd, Burnaby, BC V5M 3Z3',
# website: 'www.actcommunity.ca',
# description: ''
# )
# Service.create(
# service_type: ServiceType.find_by(name: 'Supports for Children'),
# organization: Organization.find_by(name: 'Autism Community Training (ACT)'),
# category: Category.find_by(name: 'Children'),
# description: 'Information and referrals for families whose children have Autism; registry of Autism service providers'
# )
# Organization.create(
# name: 'Autism Community Training (ACT)',
# phone: '604-205-5467',
# address: '2250 Boundary Rd, Burnaby, BC V5M 3Z3',
# website: 'www.actcommunity.ca',
# description: ''
# )
# Service.create(
# service_type: ServiceType.find_by(name: 'Help in a Crisis'),
# organization: Organization.find_by(name: 'Autism Community Training (ACT)'),
# category: Category.find_by(name: 'Pregnancy & Babies'),
# description: 'Information and referrals for families whose children have Autism; registry of Autism service providers'
# )
