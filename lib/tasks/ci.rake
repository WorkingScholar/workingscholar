if ENV["RAILS_ENV"] != "production"
  namespace :ci do
    require "rubocop/rake_task"

    desc "Perform static analysis and lint with RuboCop"
    RuboCop::RakeTask.new(:rubocop)

    desc "List RuboCop offenses count"
    RuboCop::RakeTask.new("offenses") do |task|
      task.formatters = ["offenses"]
    end
  end

  desc "Run all ci tasks"
  task ci: ["ci:rubocop"]
end
