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

  # I should rewrite this method using recursion 

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
    
     elsif 
        parent.right = new_node
      end
  end

  def delete(key)
    @root = delete_recursive(@root, key)
  end

def delete_recursive(node, key)
  return nil if node.nil?

  if key > node.value
    node.right = delete_recursive(node.right, key)
  elsif key < node.value
    node.left = delete_recursive(node.left, key)
  else
    # Node with two children
    if node.left.nil?
      return node.right  # Connect parent to the right child
    elsif node.right.nil?
      return node.left   # Connect parent to the left child
    else
      # Node with two children
      successor = find_min_val(node.right)
      node.value = successor.value
      node.right = delete_recursive(node.right, successor.value)
    end
  end

  node
end

  
  def find_min_val(node)
    current_node = node
    current_node = current_node.left until current_node.left.nil?
    current_node 
  end

  def find(value)
    find_recursive(@root, value)
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

end


  my_arr = [1, 2, 3, 4, 5, 6, 7, 8, 99]

  data = Tree.new(my_arr)
