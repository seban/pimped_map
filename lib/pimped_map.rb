require 'thread'

module PimpedMap

  def self.pimp!
    Array.class_eval do
      include PimpedMap::Pimp
    end
  end


  module Pimp

    def pmap(&block)
      threads = map do |element|
        Thread.new { yield element }
      end
      threads.map { |thr| thr.join.value }
    end

  end

end
