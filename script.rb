require './node'

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    sorted_array = array.uniq.sort
    return nil if sorted_array.empty?

    build_tree_recursive(sorted_array, 0, sorted_array.length - 1)
  end

  def build_tree_recursive(sorted_array, start_index = 0, end_index)
    return nil if start_index > end_index

    mid_index = (start_index + end_index) / 2

    root = Node.new(sorted_array[mid_index])

    root.left = build_tree_recursive(sorted_array, start_index, mid_index - 1)
    root.right = build_tree_recursive(sorted_array, mid_index + 1, end_index)

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # > I should rewrite this method using recursion

  def insert(key)
    if @root.nil?
      @root = New.node(key)
      return
    end

    current_node = @root
    parent = nil

    while current_node

      parent = current_node

      if key < current_node.value
        current_node = current_node.left

      elsif key > current_node.value
        current_node = current_node.right
      else
        return
      end
    end

    new_node = Node.new(key)

    if key < parent.value
      parent.left = new_node

    elsif parent.right = new_node
    end
  end

  def delete(key)
    @root = delete_recursive(@root, key)
  end

  def find(value)
    find_recursive(@root, value)
  end

  def level_order(&block)
    values = []
    level_order_recursive(@root, values, &block)
    values if !block_given?
  end

  # task
  def inorder(&block)
    # Visits the left subtree, then the root, and finally the right subtree.
    values = []
    inorder_recursive(@root, values, &block)
    values if !block_given?
  end

  def preorder(&block)
    # Visits the left subtree, then the root, and finally the right subtree.
    values = []
    preorder_recursive(@root, values, &block)
    values if !block_given?
  end

  def postorder(&block)
    # Visits the left subtree, then the root, and finally the right subtree.
    values = []
    postorder_recursive(@root, values, &block)
    values if !block_given?
  end

  def height(node)
    height_recursive(find(node))
  end

  def depth(node)
    depth_recursive(find(node), @root, depth = 0)
  end

  def balanced?(node = @root)
    return true if node.nil?
    left_height = calc_height(node.left)
    right_height = calc_height(node.right)
     if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)
       true 
     else 
       false
      end
  end    

  def rebalance(node = @root, values = []) # 1 

    return values if node.nil?
    rebalance(node.left, values)
    values << node.value
    rebalance(node.right, values)

    @root = build_tree(values)
  end

  private

  def calc_height(node)
    return 0 if node.nil?
    left_height = calc_height(node.left)
    right_height = calc_height(node.right)
    [left_height, right_height].max + 1
  end

  def depth_recursive(node, current_node, depth = 0)
    return 0 if current_node.nil?

    if node.value < current_node.value
      depth_recursive(node, current_node.left, depth + 1)
    elsif node.value > current_node.value
      depth_recursive(node, current_node.right, depth + 1)
    else
      depth
    end
  end

  def height_recursive(node)
    return -1 if node.nil?

    left_height = height_recursive(node.left)
    right_height = height_recursive(node.right)

    [left_height, right_height].max + 1
  end

  def postorder_recursive(node, values, &block)
    return if node.nil?

    inorder_recursive(node.left, values, &block)
    inorder_recursive(node.right, values, &block)
    block_given? ? yield(node) : values << node.value
  end

  def preorder_recursive(node, values, &block)
    return if node.nil?

    block_given? ? yield(node) : values << node.value
    inorder_recursive(node.left, values, &block)
    inorder_recursive(node.right, values, &block)
  end

  def inorder_recursive(node, values, &block)
    return if node.nil?

    inorder_recursive(node.left, values, &block)
    block_given? ? yield(node) : values << node.value
    inorder_recursive(node.right, values, &block)
  end

  def find_min_val(node)
    current_node = node
    current_node = current_node.left until current_node.left.nil?
    current_node
  end

  def find_recursive(node, value)
    return nil if node.nil?

    if value > node.value
      find_recursive(node.right, value)
    elsif value < node.value
      find_recursive(node.left, value)
    else
      return node
    end
  end

  def level_order_recursive(node, values, &block)
    return if node.nil?

    block_given? ? yield(node) : values << node.value

    level_order_recursive(node.left, values, &block)
    level_order_recursive(node.right, values, &block)
  end

  def delete_recursive(node, key)
    return nil if node.nil?

    if key > node.value
      node.right = delete_recursive(node.right, key)
    elsif key < node.value
      node.left = delete_recursive(node.left, key)
    else

      if node.left.nil?

      elsif node.right.nil?
        return node.left
      else
        successor = find_min_val(node.right)
        node.value = successor.value
        node.right = delete_recursive(node.right, successor.value)
      end
    end

    node
  end
end



my_arr = [1, 2, 3, 4, 5, 9]

data = Tree.new(my_arr)
  data.insert(99999)
  data.insert(22)
p data.balanced?
 data.rebalance
 p data.balanced?
