RSpec.configure do |config|
end

require 'spec_helper'
require 'active_record'
require 'active_support'
require 'activerecord-import'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f; puts f }
Dir["./lib/**/*.rb"].sort.each { |f| require f; puts f }

ActiveRecord::Migration.maintain_test_schema!
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")