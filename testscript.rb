require 'json'
require 'fileutils'
require 'pp'

role_name = ARGV[0]
puts role_name

chef_repo = '/var/lib/jenkins/jobs/test/workspace'

app_type = ARGV[1]
puts app_type

ser_name = ARGV[2]
puts ser_name

env_role = ARGV[3]
puts env_role

type = ARGV[4]
puts type

role_file_path = File.join(chef_repo, 'Assign', "#{role_name}.json")
puts role_file_path

role_hash = JSON.parse(File.read(role_file_path))

#pp role_hash

item = role_hash["#{app_type}"]["#{ser_name}"]["#{env_role}"]["#{type}"]

if item.key?("url")
	puts "Found: "
end

puts item

if item != nil then
  puts "Inside"
  role_hash["#{app_type}"]["#{ser_name}"]["#{env_role}"]["#{type}"]["url"] = "random"
end

roleJson = File.open(role_file_path, 'w')
roleJson.write(JSON.pretty_generate(role_hash))
roleJson.close