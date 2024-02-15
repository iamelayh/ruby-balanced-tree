# BST

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end


  def build_tree(array)
      unique_array = array.uniq.sort
  end
end


arr = [1, 2, 3 , 1, 9, 5, 5, 1, 2, 9]
data = Tree.new(arr)
