module TreeMethods
def <=>(other)
    @data <=> other.data
end
end

class Node

    include TreeMethods

    attr_accessor :data, :left_child, :right_child

    def initialize(data)
        @data = data
        @left_child = nil
        @right_child = nil
    end
end
