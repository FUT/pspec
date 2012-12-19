module Pspec
  module Replicator
    class << self
      def optimal_processors_count
        [Parallel.processor_count - 1, 1].max
      end

      def replicate
        optimal_processors_count.times do |index|
          number = index + 2

          drop_database number
          create_database number

          Rails.logger.info "Database #{database number} was created"
        end
      end

      private
      def drop_database(number)
        ActiveRecord::Base.connection.execute %(drop database if exists "#{database number}")
      end

      def create_database(number)
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
