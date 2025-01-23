require 'csv'
require 'fileutils'

# Read metadata CSV
csv_path = File.join(Dir.pwd, '_data', 'metadata.csv')
items_dir = File.join(Dir.pwd, '_items')

# Create _items directory if it doesn't exist
FileUtils.mkdir_p(items_dir)

# Read CSV and generate pages
CSV.foreach(csv_path, headers: true) do |row|
  # Skip if required fields are missing
  next if row['objectid'].nil? || row['title'].nil?

  # Create item page content
  content = <<~CONTENT
---
layout: item_page
title: #{row['title']}
format: #{row['format']}
date: #{row['date']}
subject: #{row['subject']}
description: #{row['description']}
identifier: #{row['identifier']}
type: #{row['type']}
language: #{row['language']}
rights: #{row['rights']}
level: #{row['level']}
series: #{row['series']}
file: #{row['file']}
objectid: #{row['objectid']}
---
CONTENT

  # Write to file
  File.write(File.join(items_dir, "#{row['objectid']}.md"), content)
end

puts "Item pages generated successfully!"
