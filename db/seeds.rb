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
  {first_name: 'Hung',
   last_name: 'Chris',
   email: 'cc@nowayjose.com',
   password: PASSWORD,
   is_admin: false,
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
{name: 'Child Care & Preschools'},
{name: 'Community Clubs'},
{name: 'Education'}
])

AgeGroup.create([
{age: '0-5'},
{age: '6-12'},
{age: 'Adults'},
{age: 'All Ages'}
])

Organization.create(
 description: '',
 name: 'Reach Child & Youth Development Society',
 address: '3-3800 72nd Street, Ladner',
 phone: '604-946-6622 ext 308',
 website: 'http://reachdevelopment.org/reach-developmental-preschool-south-delta.html',
)

Program.create(
program_type: ProgramType.find_by(name: 'Childcare & Preschools'),
organization: Organization.find_by(name: 'Reach Child & Youth Development Society'),
description: 'Reach Developmental Preschool South Delta',
registration: 'Registered',
cost: 'Paid'
)

ProgramAgeGroup.create(
program: Program.find_by(description: 'Reach Developmental Preschool South Delta',),
age_group: AgeGroup.find_by(age: '0-5')
)
# Program 36 from Excel
Organization.create(
 description: '',
 name: 'Childcare Resource Referral',
 address: '',
 phone: '',
 website: 'http://www.options.bc.ca/',
  )

Program.create(
program_type: ProgramType.find_by(name: 'Child Care'),
organization: Organization.find_by(name: 'Childcare Resource Referral'),
description: 'Listing of before and after school care providers',
registration: 'Registered',
cost: 'Paid'
)

ProgramAgeGroup.create(
program: Program.find_by(description: 'Listing of before and after school care providers'),
age_group: AgeGroup.find_by(age: '6-12'),
)
# Program 22 from Excel
Organization.create(
description: '',
name: 'Tsawwassen First Nation',
address: '1926 Tsawwassen Dr N, Delta, BC',
phone: '604-943-1322 ext 224',
website: 'http://tsawwassenfirstnation.com/programs-and-services/smuyuqwa-lelum-ecd-centre/',
 )

Program.create(
program_type: ProgramType.find_by(name: 'Childcare & Preschools'),
organization: Organization.find_by(name: 'Tsawwassen First Nation'),
description: 'Smuyuq’wa’ Lelum Early Childhood Development Centre is a fully licensed, state of the art, childcare facility, providing quality care for children aged 6 months to 6 years.',
registration: 'Registered',
cost: 'Paid'
)

ProgramAgeGroup.create(
program: Program.find_by(description: 'Smuyuq’wa’ Lelum Early Childhood Development Centre is a fully licensed, state of the art, childcare facility, providing quality care for children aged 6 months to 6 years.'),
age_group: AgeGroup.find_by(age: '0-5'),
)
# Program 47 from Excel
Organization.create(
description: '',
name: 'Navy League',
address: '',
phone: '',
website: 'http://www.navyleague.ca/eng/',
 )

Program.create(
program_type: ProgramType.find_by(name: 'Community Clubs'),
organization: Organization.find_by(name: 'Navy League'),
description: 'Leadership, sailing, camping, first aid, drilling',
registration: 'Registered',
cost: 'Paid'
)

ProgramAgeGroup.create(
program: Program.find_by(description: 'Leadership, sailing, camping, first aid, drilling'),
age_group: AgeGroup.find_by(age: '6-12'),
)
# Program 103 from Excel
Organization.create(
name: 'Special Olympics',
phone: '',
address: '',
website: 'www.socdelta.org',
description: ''
)
Program.create(
program_type: ProgramType.find_by(name: 'Sports'),
organization: Organization.find_by(name: 'Special Olympics'),
description: 'Basketball, Bowling, Curling, Floor Hockey, Rhythmic Gymnastics, Alpine Skiing, Swimming, Soccer, Softball, Track and Field, Golf',
registration: 'Registered',
cost: 'Paid'
)
ProgramAgeGroup.create(
program: Program.find_by(description: 'Basketball, Bowling, Curling, Floor Hockey, Rhythmic Gymnastics, Alpine Skiing, Swimming, Soccer, Softball, Track and Field, Golf'),
age_group: AgeGroup.find_by(age: '6-12'),
)
# Service 2 from Excel
Organization.create(
name: 'Reporting child abuse',
phone: '1-800-663-9122',
address: '',
website: 'http://www2.gov.bc.ca/gov/content/safety/public-safety/protecting-children/keeping-kids-safe',
description: ''
)
Service.create(
service_type: ServiceType.find_by(name: 'Child Advocacy'),
organization: Organization.find_by(name: 'Reporting child abuse'),
category: Category.find_by(name: 'Children'),
description: 'If you think a child or youth under 19 years of age is being abused or neglected, you have the legal duty to report your concern'
)
# Service 29 from Excel
Organization.create(
name: 'Child Care Resource & Referral Program (CCRR)',
phone: '604-572-8032',
address: '',
website: 'http://www.childcareoptions.ca/',
description: ''
)
Service.create(
service_type: ServiceType.find_by(name: 'Assistance with fees'),
organization: Organization.find_by(name: 'Child Care Resource & Referral Program (CCRR)'),
category: Category.find_by(name: 'Families'),
description: 'Information about eligibility and rates for child care subsidies.'
)
# Service 49 from Excel
Organization.create(
name: 'Fraser Health',
phone: '604-507-5400',
address: '',
website: 'http://www.fraserhealth.ca/health-info/pregnancy-and-babies/',
description: ''
)
Service.create(
service_type: ServiceType.find_by(name: 'Health & Development'),
organization: Organization.find_by(name: 'Fraser Health'),
category: Category.find_by(name: 'Pregnancy & Babies'),
description: 'Health program and information for pregnant moms and infants.'
)
# Service 45 from Excel
Organization.create(
name: 'Family Support Institute',
phone: '1-800-441-5403',
address: '227 6th Street New Westminster, BC V3L 3A5',
website: 'https://familysupportbc.com/',
description: ''
)
Service.create(
service_type: ServiceType.find_by(name: 'Supports for families'),
organization: Organization.find_by(name: 'Family Support Institute'),
category: Category.find_by(name: 'Families'),
description: 'Peer support network for parents who have children with physical and mental extra support needs.'
)
# Service 27 from Excel
Organization.create(
name: 'Boys and Girls Club South Coast BC',
phone: '604-591-9262',
address: '3rd Floor, 11861 88th Avenue, Delta, BC, V4C 3C6',
website: 'https://www.bgcbc.ca/',
description: ''
)
Service.create(
service_type: ServiceType.find_by(name: 'Assistance with fees'),
organization: Organization.find_by(name: 'Boys and Girls Club South Coast BC'),
category: Category.find_by(name: 'Families'),
description: 'Financial subsidies for summer camp and after school programs.'
)

# Service 15 from Excel
Organization.create(
name: 'Autism Community Training (ACT)',
phone: '604-205-5467',
address: '2250 Boundary Rd, Burnaby, BC V5M 3Z3',
website: 'www.actcommunity.ca',
description: ''
)
Service.create(
service_type: ServiceType.find_by(name: 'Supports for Children'),
organization: Organization.find_by(name: 'Autism Community Training (ACT)'),
category: Category.find_by(name: 'Children'),
description: 'Information and referrals for families whose children have Autism; registry of Autism service providers'
)
Organization.create(
name: 'Autism Community Training (ACT)',
phone: '604-205-5467',
address: '2250 Boundary Rd, Burnaby, BC V5M 3Z3',
website: 'www.actcommunity.ca',
description: ''
)
Service.create(
service_type: ServiceType.find_by(name: 'Help in a Crisis'),
organization: Organization.find_by(name: 'Autism Community Training (ACT)'),
category: Category.find_by(name: 'Pregnancy & Babies'),
description: 'Information and referrals for families whose children have Autism; registry of Autism service providers'
)
