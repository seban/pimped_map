pimped_map
==========

Inspiration
-----------
I met [pmap](http://clojuredocs.org/clojure_core/clojure.core/pmap) function while learning Clojure language and 
I thought "I would be great to have such a method in Ruby". So I wrote it so you can ...

Pimp your map!
-------------

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

You can also specify how many threads can handle Future objects at once

  ```ruby
  PimpedMap.pimp!(pool_size: 10)
  ```

Gotchas
-------

While my implementation is really simple and naive you can use other libs which give desired feature.
For example [pmap](https://github.com/bruceadams/pmap) gem. Implementing pmap also should be simple with
[Celluloid](https://github.com/celluloid/celluloid) while it has future feature implemented. My lib hasn't 
got any tests, I just have no idea how to write tests for this code.
