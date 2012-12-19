module Pspec
  module Replicator
    class << self
      def optimal_processors_count
        Parallel.processor_count - 1
      end

      def copy
        optimal_processors_count.times do |n|
          drop database, n
          create database, n
        end

        puts "Database #{database}#{number} was created"
      end

      private
      def drop(database, number)
        ActiveRecord::Base.connection.execute %(drop database if exists "#{database}#{number}")
      end

      def create(database, number)
        ActiveRecord::Base.connection.execute %(create database "#{database}#{number}" with template "#{database}" owner "#{owner}")
      end

      def database
        ActiveRecord::Base.configurations['test']['database']
      end

      def owner
        ActiveRecord::Base.configurations['test']['username']
      end
    end
  end
end
