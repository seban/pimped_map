require 'thread'

module PimpedMap

  autoload :Future, 'pimped_map/future'
  autoload :ThreadPool, 'pimped_map/thread_pool'

  def self.pimp!(options = {})
    pool_size = options.fetch :pool_size, 4
    Array.class_eval do
      include PimpedMap::Pimp
    end
    PimpedMap::Future.internal_pool = PimpedMap::ThreadPool.new(pool_size)
  end

  module Pimp

    def pmap(&block)
      futures = map do |element|
        PimpedMap::Future.new(element, &block)
      end
      futures.map { |fut| fut.value }
    end

  end

end
