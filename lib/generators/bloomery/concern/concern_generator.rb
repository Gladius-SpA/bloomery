require 'rails/generators/named_base'

module Bloomery
  module Generators
    class ConcernGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def create_concern_file
        concern_dir_path = 'app/models/concerns'
        generator_path = concern_dir_path + "/#{file_name}.rb"

        Dir.mkdir(concern_dir_path) unless File.exist?(concern_dir_path)

        template 'concern.erb', generator_path
      end
    end
  end
end
