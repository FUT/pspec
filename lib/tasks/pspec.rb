namespace :pspec do
  task prepare: :environment do
    Rails.env = 'test'

    Pspec::ParallelDb.prepare
  end

  task run: :environment do
    Rails.env = 'test'

    Rake::Task['parallel:spec'].invoke Pspec::Replicator.optimal_processors_count
  end
end

