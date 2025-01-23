#!/usr/bin/env ruby
require 'yaml'
require 'fileutils'

# Load the items data
items = YAML.load_file('_data/items.yml')

# Create items directory if it doesn't exist
FileUtils.mkdir_p('items')

# Generate a page for each item
items.each do |series_file, items_array|
  series_id, file_id = series_file.split('_')
  
  items_array.each do |item|
    # Create the item page content
    content = <<~CONTENT
---
layout: item_page
title: "#{item['title']}"
series_id: "#{series_id}"
file_id: "#{file_id}"
identifier: "#{item['identifier']}"
creator: "#{item['creator']}"
date: #{item['date']}
type: "#{item['type']}"
format: "#{item['format']}"
description: "#{item['description']}"
subject: "#{item['subject']}"
language: "#{item['language']}"
rights: "#{item['rights']}"
---
CONTENT

    # Write the file
    File.write("items/#{item['identifier']}.html", content)
    puts "Created items/#{item['identifier']}.html"
  end
end
