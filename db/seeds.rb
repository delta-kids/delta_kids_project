AgeGroup.destroy_all
ProgramType.destroy_all
ServiceType.destroy_all
Category.destroy_all
Organization.destroy_all
Program.destroy_all

Topic.destroy_all
Service.destroy_all
User.destroy_all

User.create([
  {first_name: 'Andrea',
   last_name: 'Lemire',
   email: 'coordinator@deltakids.ca',
   password: "DeltaKids2017",
   is_admin: true,
   phone: ''},
  {first_name: 'Chris',
   last_name: 'R',
   email: 'chrisryan@hotmail.ca',
   password: ENV["base_password"],
   is_admin: true,
   phone: ''},
  {first_name: 'Elaine',
   last_name: 'White',
   email: 'ewhite@bgcbc.ca',
   password: "BGCSC6554",
   is_admin: true,
   phone: ''},
  ])

  EventType.create([
  {name: 'Arts & Culture'},
  {name: 'Education'},
  {name: 'Entertainment'},
  {name: 'Health'},
  {name: 'Sports'},
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
{name: 'Education'},
{name: 'School Break Camps'}
])

AgeGroup.create([
{age: '0-5'},
{age: '6-12'},
{age: 'All ages'},
{age: 'N/A'}
])


require 'csv'

organization_img_file  = File.open(File.join(Rails.root,"app/assets/images/Logo - Delta City.png"))

csv_text = File.read(Rails.root.join('db', 'programs_with_agencies_sheet2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  Organization.create(
  description: '',
  name: row['Agencies'],
  address: row['Address'],
  phone: row['Phone Number'],
  website: row['Website'],
  image: organization_img_file,
  # image: File.open(File.join(Rails.root,"public/assets/logos/#{row['Logo']}")),
  )

  program_img_file  = File.open(File.join(Rails.root,"app/assets/images/DeltaKids#{rand(4)}.jpg"))

  Program.create(
  program_type: ProgramType.find_by(name:row['Programs']),
  organization: Organization.find_by(name:row['Agencies']),
  program_description: row['Short Description that relate to program'],
  registration: row['Registration'],
  cost: row['Cost'],
  image: program_img_file,
  )

  ProgramAgeGroup.create(
  program: Program.find_by(program_description: row['Short Description that relate to program']),
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
   image: organization_img_file,
  #  image: File.open(File.join(Rails.root,"public/assets/logos/#{row['Logo']}")),
  )

  service_img_file  = File.open(File.join(Rails.root,"app/assets/images/DeltaKids#{rand(4)}.jpg"))

  Service.create(
  service_type: ServiceType.find_by(name: row['Service']),
  organization: Organization.find_by(name: row['Agency']),
  category: Category.find_by(name: row['Category']),
  service_description: row['Description that relate to service'],
  image: service_img_file,
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
  resource_name: row['PDF Name'],
  feature: row['Feature?'],
  resource_location: row['Location'],
  description: row['Description'],
  approved: true,
  resource_type: row['Type'],
  remote_resource_file_url: "https://s3-us-west-2.amazonaws.com/delta-kids-bucket/uploads/resource/resource_file/#{row['PDF Name'].gsub(/\s+/, '+')}.pdf",
  # resource_file: File.open(File.join(Rails.root,"public/#{row['PDF Name']}.pdf")),
  )

  ResourceTopic.create(
  resource: Resource.find_by(resource_name: row['PDF Name']),
  topic: Topic.find_by(topic_name: row['Topic']),
  )

  resource_tag = row['Tags'].to_s.split(", ")
  resource_tag.each do |r|

  ResourceTagging.create(
  resource: Resource.find_by(resource_name: row['PDF Name']),
  tag: Tag.find_by(name: r),
  )
end

  ResourceAgeGroup.create(
  resource: Resource.find_by(resource_name: row['PDF Name']),
  age_group: AgeGroup.find_by(age: row['Age']),
  )

end



  puts "Resource Count:#{Resource.count}"
  puts "Tag Count:#{Tag.count}"
  puts "ResourceTagging Count:#{ResourceTagging.count}"
  puts "ResourceTopics Count:#{ResourceTopic.count}"
  puts "ResourceAgeGroup Count:#{ResourceAgeGroup.count}"
