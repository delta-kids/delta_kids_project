AgeGroup.destroy_all
ProgramType.destroy_all
ServiceType.destroy_all
Category.destroy_all
Organization.destroy_all
Program.destroy_all

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
{name: 'Child Care'},
{name: 'Community Clubs'},
{name: 'Education'}
])

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
#
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
address: '#100-6846 King George Boulevard, Surrey, BC',
website: 'http://www.childcareoptions.ca/',
description: ''
)
Service.create(
service_type: ServiceType.find_by(name: 'Assistance with fees'),
organization: Organization.find_by(name: 'Child Care Resource & Referral Program (CCRR)'),
category: Category.find_by(name: 'Families'),
description: 'Information about eligibility and rates for child care subsidies.'
)
# Service 48 from Excel
Organization.create(
name: 'Fraser Health',
phone: '604-507-5400',
address: '11245 84 Avenue Delta, B.C. V4C 2L9',
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
