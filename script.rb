class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    sorted_array = array.uniq.sort
    return nil if sorted_array.empty?

    build_tree_recursion(sorted_array, 0, sorted_array.length - 1)
  end

  def build_tree_recursion(sorted_array, start_index = 0, end_index)
    return nil if start_index > end_index

    mid_index = (start_index + end_index) / 2

    root = Node.new(sorted_array[mid_index])

    root.left = build_tree_recursion(sorted_array, start_index, mid_index - 1)
    root.right = build_tree_recursion(sorted_array, mid_index + 1, end_index)

    root
  end
end
