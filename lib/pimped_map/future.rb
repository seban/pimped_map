class PimpedMap::Future

  def initialize(*args, &callable)
    @thread = Thread.new { callable.call(*args) }
  end

  def value
    @thread.value
  end

end
