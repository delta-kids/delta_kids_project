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

  EventType.create([
  {name: 'Arts & Culture'},
  {name: 'Education'},
  {name: 'Entertainment'},
  {name: 'Health'},
  {name: 'Sports'},
  ])

Event.create([
  {title: 'Ladner Test Event',
  start_date: "2017-10-29",
  end_date: "2017-10-29",
  start_time: "12:00",
  end_time: "2:00",
  event_location: "Ladner",
  address: "4600 Clarence Taylor Crescent, Delta, BC V4K 3X3",
  cost: "Free",
  approved: true,
  featured: true,
  event_type: EventType.find_by(id: 1),
  registration: "Registered",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  more_info: "www.codecore.ca",
  contact_name: "John Doe",
  contact_email: "j.doe@fake.ca"},
])

Event.create([
  {title: 'North Delta Test Event',
  start_date: "2017-10-25",
  end_date: "2017-10-25",
  start_time: "17:00",
  end_time: "18:00",
  event_location: "North Delta",
  address: "11415 84 Avenue, Delta, BC  V4C 2L9",
  cost: "Free",
  approved: true,
  featured: true,
  event_type: EventType.find_by(id: 2),
  registration: "Registered",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  more_info: "www.codecore.ca",
  contact_name: "John Doe",
  contact_email: "j.doe@fake.ca"},
])

Event.create([
  {title: 'Tsawwassen Test Event',
  start_date: "2017-10-15",
  end_date: "2017-10-15",
  start_time: "11:00",
  end_time: "3:00",
  event_location: "Tsawwassen",
  address: "1172 56 Street, Delta, BC V4L 2A3",
  cost: "Free",
  approved: true,
  featured: true,
  event_type: EventType.find_by(id: 4),
  registration: "Drop In",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  more_info: "www.codecore.ca",
  contact_name: "John Doe",
  contact_email: "j.doe@fake.ca"},
])

Topic.create([
{topic_name: 'Physical Health'},
{topic_name: 'Mental Health'},
{topic_name: 'Child Development'},
{topic_name: 'Policy'},
{topic_name: 'Child Safety'},
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
{name: 'Meals'}
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
{name: 'Community Clubs'},
{name: 'Education'}
])

AgeGroup.create([
{age: '0-5'},
{age: '6-12'},
{age: 'Adults'},
{age: 'N/A'}
])


require 'csv'

csv_text = File.read(Rails.root.join('db', 'programs_with_agencies_sheet2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  Organization.create(
  description: '',
  name: row['Agencies'],
  address: row['Address'],
  phone: row['Phone Number'],
  website: row['Website'],
  )

  program_img_file  = File.open(File.join(Rails.root,"app/assets/images/DeltaKids#{rand(4)}.jpg"))

  Program.create(
  program_type: ProgramType.find_by(name:row['Programs']),
  organization: Organization.find_by(name:row['Agencies']),
  description: row['Short Description that relate to program'],
  registration: row['Registration'],
  cost: row['Cost'],
  image: program_img_file
  )

  ProgramAgeGroup.create(
  program: Program.find_by(description: row['Short Description that relate to program']),
  age_group: AgeGroup.find_by(age: row['Age Group']),
  )

end

puts "There are now #{Program.count} rows in the program table and #{Organization.count} rows in the organization table"

csv_text = File.read(Rails.root.join('db', 'services_with_agencies_sheet2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  Organization.create(
   description: '',
   name: row['Agency'],
   address: row['Address'],
   phone: row['Phone Number'],
   website: row['Website'],
  )

  service_img_file  = File.open(File.join(Rails.root,"app/assets/images/DeltaKids#{rand(4)}.jpg"))

  Service.create(
  service_type: ServiceType.find_by(name: row['Service']),
  organization: Organization.find_by(name: row['Agency']),
  category: Category.find_by(name: row['Category']),
  description: row['Description that relate to service'],
  image: service_img_file
  )

  name_tag = row['Tags'].to_s.split(", ")
  name_tag.each do |r|
    Tag.create(name: r)
  end

end

puts "There are now #{Service.count} rows in the Service table and #{Tag.count} rows in the Tag table and  #{Organization.count} rows in the organization table"


csv_text = File.read(Rails.root.join('db', 'resources_info_sheet1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|

  name_tag = row['Tags'].to_s.split(", ")
  name_tag.each do |r|
    Tag.create(name: r)
  end

  Resource.create(
  name: row['PDF Name'],
  feature: row['Feature?'],
  resource_location: row['Location'],
  description: row['Description'],
  approved: true,
  resource_type: row['Type'],
  )

  ResourceTopic.create(
  resource: Resource.find_by(name: row['PDF Name']),
  topic: Topic.find_by(topic_name: row['Topic']),
  )

  resource_tag = row['Tags'].to_s.split(", ")
  resource_tag.each do |r|

  ResourceTagging.create(
  resource: Resource.find_by(name: row['PDF Name']),
  tag: Tag.find_by(name: r),
  )
end

  ResourceAgeGroup.create(
  resource: Resource.find_by(name: row['PDF Name']),
  age_group: AgeGroup.find_by(age: row['Age']),
  )

end



  puts "Resource Count:#{Resource.count}"
  puts "Tag Count:#{Tag.count}"
  puts "ResourceTagging Count:#{ResourceTagging.count}"
  puts "ResourceTopics Count:#{ResourceTopic.count}"
  puts "ResourceAgeGroup Count:#{ResourceAgeGroup.count}"
