require "rubocop/rake_task"

namespace :ci do
  desc "Perform static analysis and lint with RuboCop"
  RuboCop::RakeTask.new(:rubocop)

end

desc "Run all ci tasks"
task ci: ["ci:rubocop"]
