namespace :test do
  desc 'Measures test coverage'
  task :coverage do
    rm_f 'coverage'
    system 'rcov --rails --text-summary test/*/*_test.rb'
  end
end
