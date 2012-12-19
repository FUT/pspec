module Pspec
  module Replicator
    DATABASE_NAME = ActiveRecord::Base.configurations['test']['database']

    class << self
      def optimal_processors_count
        Parallel.processor_count - 1
      end

      def copy
        optimal_processors_count.times do |n|
          drop_database n
          create_database n
        end

        puts "Database #{DATABASE_NAME}#{number} was created"
      end

      private
      def drop_database(number)
        ActiveRecord::Base.connection.execute %(drop database if exists "#{DATABASE_NAME}#{number}")
      end

      def create_database(number)
        owner = ActiveRecord::Base.configurations['test']['username']
        ActiveRecord::Base.connection.execute %(create database "#{DATABASE_NAME}#{number}" with template "#{DATABASE_NAME}" owner "#{owner}")
      end
    end
  end
end
