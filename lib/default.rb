require 'compass'
require 'nanoc-sprockets'

Compass.add_project_configuration File.expand_path('config/compass.rb')
Sass.load_paths << Compass::Frameworks['compass'].stylesheets_directory