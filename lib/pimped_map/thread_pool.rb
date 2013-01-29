# -*- coding: utf-8 -*-
require "thread"

class PimpedMap::ThreadPool

  def initialize(pool_size)
    @pool_size = pool_size
    @pool = Queue.new
    @pool_size.times do |n|
      @pool << n
    end
  end

  def get(*args, &block)
    thr_num = @pool.pop
    begin
      thr = Thread.new do
        Thread.current[:num] = thr_num
        begin
          block.call(*args)
        rescue Exception => ex
          puts ex.message
        ensure
          @pool << thr_num
        end
      end
      thr
    end
  end

  private

  def new_thread
    Thread.new do
      Thread.current[:jobs] = Queue.new
      begin
        job, args = Thread.current[:jobs].pop
        job.call(*args)
        rand(100)
       rescue Exception => ex
         puts ex.message
       ensure
        @pool << new_thread
      end
    end
  end

end
