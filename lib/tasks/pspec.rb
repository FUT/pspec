def test_env!
  Rails.env = 'test'
end

namespace :pspec do
  task full_prepare: :environment do
    test_env!
    Pspec::ParallelDb.prepare
  end

  task prepare: :environment do
    test_env!
    Pspec::Replicator.replicate
  end

  task run: :environment do
    test_env!
    Rake::Task['parallel:spec'].invoke Pspec::Replicator.optimal_processors_count
  end

  task default: [:run]
end

