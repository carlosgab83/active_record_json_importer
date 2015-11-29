# encoding: utf-8

# The idea is re-utilization of this methods in any spec

def create_arec(table_name, &block)
  klass = Class.new(ActiveRecord::Base){self.table_name = table_name}
  klass.class_eval &block
  klass
end

def create_test_table_and_activerecord(table_name)
	# don't output all the migration activity
	ActiveRecord::Migration.verbose = false

	# execute the migration, creating tables
	ActiveRecord::Schema.define(:version => 1) do

		create_table table_name.to_sym do |t|
			t.integer :a1
			t.text :a2
		end

	end#migration

	Kernel.const_set(table_name.singularize.camelize, create_arec(table_name) {}) unless defined? @table11.singularize.camelize.constantize == "constant"
end

def drop_test_table(table_name)
	ActiveRecord::Migration.verbose = false
	# execute the migration, creating tables
	ActiveRecord::Schema.define(:version => 2) do
		drop_table "#{table_name}".to_sym
	end
end

def create_valid_json_file(file_name)
	File.open(@file_name,'w') do |f|
		f.write '{"a1": 1, "a2": "pool1"}' + "\n"
		f.write '{"a1": 2, "a2": "pool2"}' + "\n"
	end
end

def create_invalid_json_file(file_name)
	File.open(file_name,'w') do |f|
		f.write '"a1" 1 "a2" "pool1"'
	end
end

def delete_json_file(file_name)
	FileUtils.rm(file_name)
end