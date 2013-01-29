pimped_map
==========

Pimp your map!

  ```ruby
  1.9.3-p327 :001 > require 'pimped_map'
   => true
  1.9.3-p327 :002 > PimpedMap.pimp!
   => Array
  1.9.3-p327 :003 > require 'benchmark'
   => true
  1.9.3-p327 :004 > Benchmark.measure { [1,2,3,4].map { |e| sleep e } }
   =>   0.000000   0.000000   0.000000  10.000747
  1.9.3-p327 :005 > Benchmark.measure { [1,2,3,4].pmap { |e| sleep e } }
   =>   0.000000   0.010000   0.010000   4.001741
  ```


PimpedMap also gives you Future class which you can use:

  ```ruby
  futurum = PimpedMap::Future.new(2) { |n| sleep n ; n + 10 }
  futurum.value
  ```

Execution of passed block will be handle in thread. Calling value method on future object will
block till thread end his work.
