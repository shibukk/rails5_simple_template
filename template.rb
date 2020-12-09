require 'bundler'

# Modify .gitignore with gibo
run 'gibo dump macOS Ruby Rails JetBrains SASS SublimeText >> .gitignore' rescue nil
gsub_file '.gitignore', /^config\/initializers\/secret_token\.rb$/, ''
gsub_file '.gitignore', /^config\/secrets\.yml$/, ''

# Ruby Version
ruby_version = `ruby -v`.scan(/\d\.\d\.\d/).flatten.first
insert_into_file 'Gemfile',%(
ruby '#{ruby_version}'
), after: "source 'https://rubygems.org'"
run "echo '#{ruby_version}' > ./.ruby-version"

Bundler.with_unbundled_env do
  run 'bundle install --path vendor/bundle --jobs=4 --without production'
  run 'bundle binstubs bundler --force'
end

# Add docker files
get 'https://raw.github.com/shibukk/rails_simple_template/master/bin/start_server', 'bin/start_server'
get 'https://raw.github.com/shibukk/rails_simple_template/master/root/docker-compose.yml', 'docker-compose.yml'
get 'https://raw.github.com/shibukk/rails_simple_template/master/docker/.env', 'docker/.env'
get 'https://raw.github.com/shibukk/rails_simple_template/master/docker/web/Dockerfile', 'docker/web/Dockerfile'

gsub_file 'docker/web/Dockerfile', /%RUBY_VERSION/, ruby_version

run 'chmod 0755 bin/start_server'
