class Node
  def initialize(b)
    @kv = {}
    @b = b
    @edges = []
  end

  SearchResult = Struct.new(:type, :index, keyword_init: true) do
    FOUND = 1
    GODOWN = 2
    def self.found(index)
      new(type: FOUND, index: index)
    end

    def self.go_down(index)
      new(type: GODOWN, index: index)
    end

    def found?
      type == FOUND
    end

    def go_down?
      type == GODOWN
    end
  end

  def search(key)
    @kv.keys.each_with_index do |k, i|
      if k == key
        return SearchResult.found(i)
      elsif k > key
        return SearchResult.go_down(i)
      else
        # k < key
        # do nothing
      end
    end

    SearchResult.go_down(@kv.size)
  end

  def delete!(key)
    v = @kv[key]
    @kv[key] = nil
    v
  end

  def insert(key, value)
    @kv[key] = value
    @kv = @kv.sort_by { |k, _| k }.to_h

    value
  end

  def update(key, value)
    @kv[key] = value
  end

  def split!
    raise "key size != #{@b}" if @kv.size != @b

    pivot = @kv.size / 2
    arr = @kv.to_a
    kv_pair = arr[pivot]

    # detach nodes
    right_node = Node.new(@b)
    arr[pivot + 1 .. -1].each do |k, v|
      right_node.insert(k, v)
    end

    # split edges
    @edges.select { |e|
      e.max_key > kv_pair.first
    }.map { |e|
      @edges.delete(e)
    }.each do |e|
      right_node.add_edge(e)
    end

    # remove kvs
    arr[pivot .. -1].each do |k, _|
      @kv.delete(k)
    end

    [kv_pair, right_node]
  end

  def add_edge(node)
    @edges << node
    @edges = @edges.sort_by { |e| e.max_key }
    node
  end

  def should_split?
    @kv.keys.size == @b
  end

  def get_edge(index)
    @edges[index]
  end

  def get_value_by_key(key)
    @kv[key]
  end

  def deleted?
    @deleted
  end

  def max_key
    keys.max
  end

  private

  def keys
    @kv.keys
  end
end
