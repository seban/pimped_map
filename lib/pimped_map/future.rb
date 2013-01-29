class PimpedMap::Future

  class << self
    attr_accessor :internal_pool
  end

  def initialize(*args, &callable)
    @thread = internal_pool.get(*args, &callable)
  end

  def value
    @thread.value
  end

  private

  def internal_pool
    self.class.internal_pool
  end

end
