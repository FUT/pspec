module Pspec
  class Railtie < ::Rails::Railtie
    rake_tasks do
      require 'tasks/pspec'
    end
  end
end
