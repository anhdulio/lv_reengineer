# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/puma'
require 'capistrano/sitemap_generator'

# Fix issue Puma move to 3.0 in 2017 http://stackoverflow.com/questions/43014993/dont-know-how-to-build-task-start-when-run-cap-production-deploy-for-capist/43021458
install_plugin Capistrano::Puma

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }