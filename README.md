# active_record_json_importer
####Simple and fast way to bulk import massive active records into database. It uses the awesome activerecord-import gem
 - Fast
 - Simple
 - Awesome
 - Configure each bulk size, if you want.


####Installation
`gem install active_record_json_importer` 

or in your Gemfile:

`gem 'active_record_json_importer'`

####Usage

```ruby
import_status = BulkJsonImporter::Importer.new(file: 'input.txt', active_record_class: Person).import
```

####Input example
```
{"name": "Carlos", "last_name": "Ochoa", age: 32 }
{"name": "Jhon",   "last_name": "Doe",   age: 25 }
```

it is all. Enjoy.



