set :user, "lett"
set :rails_env, "production"
server "gondola.lett.at", :roles => %w(web app db), :primary => true, :user => "lett"

set :linked_files, fetch(:linked_files, []).push(".env.production")
