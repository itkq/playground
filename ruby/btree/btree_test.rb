require_relative 'btree'

class AssertError < StandardError; end

def assert_equal(expected, actual)
  if expected != actual
    raise AssertError.new("expected: #{expected}, actual #{actual}")
  end
end

btree = BTree.new(b: 3)
assert_equal(btree.find(0), nil)
btree.insert(50, 'A')
btree.insert(10, 'B')
btree.insert(30, 'C')
btree.insert(60, 'D')
btree.insert(20, 'E')
btree.insert(40, 'F')
assert_equal(btree.find(50), 'A')
assert_equal(btree.find(30), 'C')
assert_equal(btree.delete(30), 'C')
btree.insert(30, 'G')
assert_equal(btree.find(30), 'G')
btree.insert(90, 'H')
btree.insert(80, 'I')
assert_equal(btree.find(50), 'A')
assert_equal(btree.delete(50), 'A')
