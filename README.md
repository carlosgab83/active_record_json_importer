# active_record_json_importer
#### Simple and fast way to bulk import json massive active records into database. It uses the awesome activerecord-import gem
 - Fast
 - Simple
 - Awesome
 - Configure each bulk size, if you want.


## Installation
`gem install active_record_json_importer` 

or in your Gemfile:

`gem 'active_record_json_importer'`

## Usage

```ruby
import_status = ActiveRecordJsonImporter::Importer.new(file: 'input.txt', active_record_class: Person).import
```
If you want to change the default each bulk size (5000), yo simply do
```ruby
import_status = ActiveRecordJsonImporter::Importer.new(file: 'input.txt', active_record_class: Person, records_at_once: 2000).import
```

### Input example
```
{"name": "Carlos", "last_name": "Ochoa", "age": 32 }
{"name": "Jhon",   "last_name": "Doe",   "age": 25 }
```

it is all. Enjoy.



