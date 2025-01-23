module Jekyll
  class ItemPageGenerator < Generator
    safe true

    def generate(site)
      site.data['items'].each do |series_file, items|
        series_id, file_id = series_file.split('_')
        
        items.each do |item|
          site.pages << ItemPage.new(site, site.source, 'items', item, series_id, file_id)
        end
      end
    end
  end

  class ItemPage < Page
    def initialize(site, base, dir, item, series_id, file_id)
      @site = site
      @base = base
      @dir = dir
      @name = "#{item['identifier']}.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'item.html')

      self.data['title'] = item['title']
      self.data['series_id'] = series_id
      self.data['file_id'] = file_id
      
      # Copy all item metadata to page data
      item.each do |key, value|
        self.data[key] = value
      end
    end
  end
end
