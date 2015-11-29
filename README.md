# simplest_benchmark
####Benchmark your code fastest, simplest and get pragmatic results.
 - Perfectly formated for get into an spreadsheet and analyze it.
 - Inegrated with Rails logger
 - Not Rails ? don't worry, it creates a cutom simplest_benchmark.log log file
 - only two methods: sb_begin, and sb_end

It's so simple:

####Installation
`gem install simplest_benchmark` 

or in your Gemfile:

`gem 'simplest_benchmark'`

####Usage

##### Simple use
```ruby
require 'simplest_benchmark'

class MySlowClass
  include SimplestBenchmark
  
  def slow_method
    var = get_some_value
    sb_begin('heavy work')
      some_hard_work
    sb_end('heavy work')
  end
end
```

##### Nested use

```ruby
require 'simplest_benchmark'

class MySlowClass
  include SimplestBenchmark
      
  def slow_method
    var = get_some_value
    sb_begin('heavy work')
      some_hard_work
    sb_end('heavy_work')
  end
      
  def some_hard_work
    sb_begin('heavy work 1')
      hard_work_part1
    sb_end('heavy work 1')
      
    sb_begin('heavy work 2')
      hard_work_part2
    sb_end('heavy work 2')
  end
end
```

####Results

Results go to Rails log file, or to simplest_benchmark.log file.
You can simply do

`cat log/development.log | grep DEBUG`

and obtain something like:
```
DEBUG   2015-11-19 17:13:24 -0300       1447964004.003463       BEGIN   0       heavy work
DEBUG   2015-11-19 17:13:24 -0300       1447964004.003463       BEGIN   1       heavy work 1
DEBUG   2015-11-19 17:13:33 -0300       1447964013.4338706      END     1       heavy work 1  11.3775455951690674
DEBUG   2015-11-19 17:13:33 -0300       1447964004.003463       BEGIN   1       heavy work 2
DEBUG   2015-11-19 17:13:38 -0300       1447964013.4338706      END     1       heavy work 2  5.38402085203944020
DEBUG   2015-11-19 17:13:38 -0300       1448652456.6792688      END     0       heavy work    17.622838973999023
```
- field1: DEBUG text
- field2: timestamp of event
- field3: timestamp in float format
- field4: BEGIN or END event
- field5: level of deepness: For nested usage, each nested sb_begin gonna +1 this number
- field6: label identifier
- field7: amount of seconds transcurred between last sb_begin and current sb_end call.

it is all. Enjoy.



