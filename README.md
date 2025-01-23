# Digital Repository of Cheuk Kit (Philip) Chung

This digital repository exhibits the archival materials of Cheuk Kit (Philip) Chung, organized according to Rules for Archival Description (RAD) standards with Dublin Core metadata for item-level description.

## Features

- Static HTML pages organized by fonds, series, files, and item levels
- Standardized CSV metadata format following RAD and Dublin Core standards
- Interactive map visualization using Leaflet
- Chronological timeline view using TimelineJS
- Advanced search and filtering capabilities
- Responsive design with modern UI/UX

## Technical Requirements

- Ruby >= 2.7.0
- Jekyll 4.3.2
- Other dependencies listed in Gemfile

## Installation

1. Clone this repository
2. Install Ruby and Bundler if not already installed
3. Run `bundle install` to install dependencies
4. Run `bundle exec jekyll serve` to start the development server

## Directory Structure

```
.
├── _config.yml          # Site configuration
├── _data/              
│   └── metadata.csv     # Collection metadata
├── _layouts/            # Page layouts
├── _includes/           # Reusable components
├── assets/             
│   ├── images/          # Image files
│   ├── js/             # JavaScript files
│   └── css/            # CSS files
├── pages/              # Individual pages
└── objects/            # Digital objects
```

## Adding Content

1. Add digital objects to the `objects/` directory
2. Update metadata in `_data/metadata.csv`
3. Follow the metadata schema for Dublin Core elements

## License

All content is copyright Cheuk Kit (Philip) Chung. For usage beyond educational purposes, please contact ookkchung8@gmail.com.

## Contact

Cheuk Kit (Philip) Chung
Email: ookkchung8@gmail.com
