require 'thread'

module PimpedMap

  autoload :Future, 'pimped_map/future'

  def self.pimp!
    Array.class_eval do
      include PimpedMap::Pimp
    end
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
