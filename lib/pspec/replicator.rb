module Pspec
  module Replicator
    class << self
      def optimal_processors_count
        Parallel.processor_count - 1
      end

      def replicate
        optimal_processors_count.times do |number|
          drop database, number
          create database, number

          puts "Database #{database number} was created"
        end
      end

      private
      def drop(database, number)
        ActiveRecord::Base.connection.execute %(drop database if exists "#{database number}")
      end

      def create(database, number)
        ActiveRecord::Base.connection.execute %(create database "#{database number}" with template "#{database}" owner "#{owner}")
      end

      def database(number = nil)
        "#{ActiveRecord::Base.configurations['test']['database']}#{number}"
      end

      def owner
        ActiveRecord::Base.configurations['test']['username']
      end
    end
  end
end
