class Tree

  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

end


