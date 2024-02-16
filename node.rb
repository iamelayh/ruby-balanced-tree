module TreeMethods
  def <=>(other)
    @value <=> other.value
  end
end

class Node

  include TreeMethods

  attr_accessor :value, :left, :right

  def initialize(data)
    @value = data
    @left = nil
    @right = nil
  end
end

