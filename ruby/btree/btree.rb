require_relative 'node'

class BTree
  def initialize(b:)
    @b = b
    @root = Node.new(@b)

    validate!
  end

  def validate!
    if @b < 2
      raise "b should be greater than 2"
    end
  end

  def find(key)
    node = find_node(key)
    node&.get_value_by_key(key)
  end

  def update(key, value)
    insert(key, value, update: true)
  end

  def insert(key, value, update: false)
    node, history_stack = find_node(key, with_history: true)
    if node.get_value_by_key(key)
      if update || node.deleted?
        node.update(key, value)
      else
        raise "Key #{key} already found"
      end
    end

    node.insert(key, value)

    loop do
      break unless node.should_split?

      kv_pair, right_node = node.split!

      parent = history_stack.pop
      unless parent
        @root = parent = Node.new(@b)
        parent.add_edge(node)
      end

      parent.add_edge(right_node)
      parent.insert(*kv_pair)

      node = parent
    end

    value
  end

  # TODO: delete phisically ...
  def delete(key)
    node = find_node(key)
    if node.get_value_by_key(key)
      node.delete!(key)
    else
      nil
    end
  end

  private

  def find_node(key, with_history: false)
    node = @root
    history_stack = []

    loop do
      res = node.search(key)
      if res.found?
        return with_history ? [node, history_stack] : node
      else
        # GO DOWN
        next_node = node.get_edge(res.index)
        if next_node
          history_stack << node
          node = next_node
          next
        else
          return with_history ? [node, history_stack] : node
        end
      end
    end
  end
end
