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

Event.create([
  {title: 'Ladner Test Event',
  start_date: "2017-09-29",
  end_date: "2017-09-29",
  start_time: "12:00",
  end_time: "2:00",
  event_location: "Ladner",
  address: "4600 Clarence Taylor Crescent, Delta, BC V4K 3X3",
  cost: "Free",
  approved: true,
  registration: "Registered",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  more_info: "www.codecore.ca",
  contact_name: "John Doe",
  contact_email: "j.doe@fake.ca"},
])

Event.create([
  {title: 'North Delta Test Event',
  start_date: "2017-09-29",
  end_date: "2017-09-29",
  start_time: "17:00",
  end_time: "18:00",
  event_location: "North Delta",
  address: "11415 84 Avenue, Delta, BC  V4C 2L9",
  cost: "Free",
  approved: true,
  registration: "Registered",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  more_info: "www.codecore.ca",
  contact_name: "John Doe",
  contact_email: "j.doe@fake.ca"},
])

Event.create([
  {title: 'Tsawwassen Test Event',
  start_date: "2017-010-10",
  end_date: "2017-010-10",
  start_time: "11:00",
  end_time: "3:00",
  event_location: "Tsawwassen",
  address: "1172 56 Street, Delta, BC V4L 2A3",
  cost: "Free",
  approved: true,
  registration: "Registered",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  more_info: "www.codecore.ca",
  contact_name: "John Doe",
  contact_email: "j.doe@fake.ca"},
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
{age: 'Parents'},
{age: 'Childcare workers/providers'}
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
  Service.create(
  service_type: ServiceType.find_by(name: row['Service']),
  organization: Organization.find_by(name: row['Agency']),
  category: Category.find_by(name: row['Category']),
  description: row['Description that relate to service']
  )

  Tag.create(
    name: row['Tags']
  )

end

puts "There are now #{Service.count} rows in the Service table and #{Tag.count} rows in the Tag table and  #{Organization.count} rows in the organization table"


csv_text = File.read(Rails.root.join('db', 'resources_info_sheet1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|

  Resource.create(
  name: row['PDF Name'],
  feature: row['Feature?'],
  resource_location: row['Location'],
  description: row['Description'],
  approved: true,
  )

#   Resource.all.each do |resource|
#   resource_name = resource.name.downcase.gsub(' ', '_')
#   directory = File.join(Rails.root, "app/assets/images/resources/stock/#{resource_name}")
#
#   # making sure the directory for this service exists
#   if File.directory?(directory)
#     gallery = resource.create_gallery
#
#     Dir.foreach(directory) do |item|
#       next if item == '.' or item == '..'
#       # do work on real items
#       image = Photo.create!(gallery_id: gallery.id)
#       image.file.store!(File.open(File.join(directory, item)))
#       gallery.photos << image
#     end
#
#     resource.save!
#
#   end
# end


  ResourceAgeGroup.create(
  resource: Resource.find_by(name: row['PDF Name']),
  age_group: AgeGroup.find_by(age: row['Age']),
  )

  Tag.create(
    name: row['Tags']
  )

end

  puts "There are now #{Resource.count} rows in the Resource table and #{Tag.count} rows in the Tag table and  #{ResourceAgeGroup.count} rows in the ResourceAgeGroup table"
