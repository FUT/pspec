module Pspec
  module ParallelDb
    class << self
      def prepare
        puts "Optimal processors count was determined as #{Replicator.optimal_processors_count}"

        prepare_database

        Replicator.replicate
      end

      private
      def prepare_database
        Rake::Task['db:migrate'].invoke
        Rake::Task['db:test:prepare'].invoke

        puts 'Main test database was prepared'
      end
    end
  end
end
