require 'rails/generators/named_base'

module Bloomery
  module Generators
    class ServiceGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('templates', __dir__)

      def create_service_file
        service_dir_path = 'app/services'
        generator_path = service_dir_path + "/#{file_name}.rb"

        Dir.mkdir(service_dir_path) unless File.exist?(service_dir_path)

        template 'service.erb', generator_path
      end
    end
  end
end
