require 'rails/generators/base'

module Bloomery
  module Generators
    class CommentsGenerator < Rails::Generators::Base
      def create_comment_model
        Rails::Generators.invoke(
          'model',
          [
            'Comment', 'commentable:references{polymorphic}',
            'commentator:references{polymorphic}', 'content:text',
            '--no-test-framework'
          ]
        )
        file_path = 'app/models/comment.rb'
        insert_into_file(
          file_path,
          ', inverse_of: :comments',
          after: 'polymorphic: true'
        )
        write(
          file_path,
          File.read(File.expand_path('templates/model/comment.erb', __dir__)),
          'belongs_to :commentator, polymorphic: true, inverse_of: :comments'
        )
      end

      def create_comment_controller
        Rails::Generators.invoke(
          'controller', [
            'Comments', '--no-test-framework', '--skip-template-engine',
            '--no-helper', '--no-assets', '--skip-routes'
          ]
        )
        write(
          'app/controllers/comments_controller.rb',
          File.read(File.expand_path('templates/controller/comments.erb', __dir__)),
          'ApplicationController'
        )
      end

      def create_commentable_concern
        Rails::Generators.invoke('bloomery:concern', ['Commentable'])
        write(
          'app/models/concerns/commentable.rb',
          File.read(File.expand_path('templates/concern/commentable.erb', __dir__)),
          'included do'
        )
      end

      def create_commentator_concern
        Rails::Generators.invoke('bloomery:concern', ['Commentator'])
        write(
          'app/models/concerns/commentator.rb',
          File.read(File.expand_path('templates/concern/commentator.erb', __dir__)),
          'included do'
        )
      end

      def add_commentable_routes
        write(
          'config/routes.rb',
          File.read(File.expand_path('templates/route/commentable.erb', __dir__)),
          'Rails.application.routes.draw do'
        )
      end

      private

      def write(file_path, string, after)
        insert_into_file(
          file_path,
          string,
          after: after + "\n"
        )
      end
    end
  end
end
