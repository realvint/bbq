set :application, 'bbq'
set :repo_url, 'git@github.com:realvint/bbq.git'
set :deploy_to, -> { "/home/deploy/projects/#{fetch(:application)}" }
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/packs public/uploads node_modules]
set :linked_files, %w[config/database.yml config/master.key]
set :user, 'deploy'
set :keep_releases, 5
set :branch, ENV['BRANCH'] if ENV['BRANCH']

after 'deploy:restart', 'resque:restart'

Rake::Task['deploy:assets:backup_manifest'].clear_actions
