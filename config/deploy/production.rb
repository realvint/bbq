server '185.22.61.225', user: 'deploy', roles: %w[app db web resque_worker]

set :resque_environment_task, true
set :workers, { "#{fetch(:application)}*" => 1 }
