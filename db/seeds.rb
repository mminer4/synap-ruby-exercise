require 'csv'
require_relative '../lib/seeds/seeding_functions'

# If file is large, should read batches of lines instead of all at once
csv_data = File.read(Rails.root.join('lib', 'seeds', 'crm_exercise_data.csv'))
csv_content = CSV.parse(csv_data, :headers => true, :encoding => 'UTF-8')

seed_org_person_address(csv_content)

# "Person: Name: #{row[0]} Job Title: #{row[1]} Email: #{row[2]} Phone: #{row[3]} Organization: #{row[4]}"
# "Organization: Name: #{row[4]} Phone: #{row[5]} Domain: #{row[6]} Address: #{row[7]}"
# "Address: Street: #{row[7]} City: #{row[8]} State: #{row[9]} Zip: #{row[10]}"