require "active_record"
require "mysql2"

ActiveRecord::Base.configurations = {
  ENV['RACK_ENV'] => {
    adapter:  "mysql2",
    host:     ENV['DB_HOST'],
    username: ENV['DB_USER'],
    password: ENV['DB_PASSWORD'],
    database: "my_test_webapp",
  }
}
ActiveRecord::Base.establish_connection(ENV['RACK_ENV'].to_sym)

class Post < ActiveRecord::Base
end