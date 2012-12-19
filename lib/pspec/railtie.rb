module Pspec
  class Railtie < ::Rails::Railtie
    rake_tasks do
      require 'tasks/pspec.rake'
    end
  end
end
