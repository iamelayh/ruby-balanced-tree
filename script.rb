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



  

  end



  my_arr = [1, 2, 3, 4, 5, 6, 7, 8, 99]

  data = Tree.new(my_arr)
  data.insert(9)
  data.pretty_print
