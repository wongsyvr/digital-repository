require 'csv'
require 'yaml'
require 'fileutils'

module Jekyll
  class ItemPageGenerator < Generator
    safe true

    def generate(site)
      # Read metadata.csv
      csv_path = File.join(site.source, '_data', 'metadata.csv')
      return unless File.exist?(csv_path)

      # Create items directory if it doesn't exist
      items_dir = File.join(site.source, 'items')
      FileUtils.mkdir_p(items_dir)

      # Read CSV and generate pages
      CSV.foreach(csv_path, headers: true) do |row|
        # Skip if required fields are missing
        next if row['objectid'].nil? || row['title'].nil?

        # Create page
        site.pages << ItemPage.new(site, site.source, 'items', row)
      end
    end
  end

  class ItemPage < Page
    def initialize(site, base, dir, item)
      @site = site
      @base = base
      @dir = dir
      @name = "#{item['objectid']}.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'item_page.html')

      # Set page data from CSV
      self.data['title'] = item['title']
      self.data['format'] = item['format']
      self.data['date'] = item['date']
      self.data['subject'] = item['subject']
      self.data['description'] = item['description']
      self.data['identifier'] = item['identifier']
      self.data['type'] = item['type']
      self.data['language'] = item['language']
      self.data['rights'] = item['rights']
      self.data['level'] = item['level']
      self.data['series'] = item['series']
      self.data['file'] = item['file']
      
      # Add location data if available
      if item['latitude'] && item['longitude']
        self.data['location'] = {
          'latitude' => item['latitude'],
          'longitude' => item['longitude'],
          'name' => item['location']
        }
      end

      # Parse series and file from identifier
      if item['identifier']
        parts = item['identifier'].split('-')
        self.data['series_id'] = parts[0].downcase if parts[0]
        self.data['file_id'] = parts[1].downcase if parts[1]
      end

      # Add source information
      self.data['source'] = item['source'] if item['source']
    end
  end
end
