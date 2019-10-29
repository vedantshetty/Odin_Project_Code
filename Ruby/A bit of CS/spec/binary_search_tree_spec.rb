require './lib/binary_search_tree.rb'

describe Node do
  subject { Node.new(5) }
  it 'create a new node' do
    expect(subject.data).to eq(5)
  end
  context 'can compare two nodes' do
    let(:other) { Node.new(0) }
    it 'node1 > node2' do
      expect(subject <=> other).to eq(1)
    end
    it 'node1 < node2' do
      other.data = 6
      expect(subject <=> other).to eq(-1)
    end

    it 'node1 == node2' do
      other.data = 5
      expect(subject <=> other).to eq(0)
    end
  end
end

describe Tree do
  subject { Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) }
  context 'correctly builds tree' do
    it 'root is correct' do
      expect(subject.root.data).to eq(1)
    end

    it 'root left is correct' do
      expect(subject.root.left).to eq(nil)
    end

    it 'root right is correct' do 
      expect(subject.root.right.data).to eq(7)
    end

    it 'preorder is correct' do
      expect(subject.preorder).to eq([1, 7, 4, 3, 5, 23, 8, 9, 67, 6345, 324])
    end

    it 'inorder is correct' do 
      expect(subject.inorder).to eq([1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345])
    end

    it 'postorder is correct' do
      expect(subject.postorder).to eq([3, 5, 4, 9, 8, 324, 6345, 67, 23, 7, 1])
    end
  end

  context 'Inserting Elements' do
    it 'Correctly inserts values' do
      subject.insert(-1)
      expect(subject.inorder).to eq [-1, 1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345]
    end
    it 'Does not insert duplicates' do
      subject.insert(3)
      expect(subject.inorder).to eq([1, 3, 4, 5, 7, 8, 9, 23, 67, 324, 6345])
    end
  end

  context 'Deleting Elements' do
    it 'deleting elements terminal nodes' do
    end

    it 'deleting elements with children' do
    end

    it 'deleting root node' do
    end

    it 'deleting non-existing node' do 
    end
  end

  context 'finding elements' do
    it 'that does not exist in tree' do
      expect(subject.find(12)).to eq(-1)
    end

    it 'that exist as root' do
      expect(subject.find(1)).to eq(subject.root)
    end

    it ' on left side' do 
      expect(subject.find(3).data).to eq(3)
    end

    it 'on right side' do 
      expect(subject.find(67).data).to eq 67
    end

    it 'as terminal node' do
      expect(subject.find(324).data).to eq 324
    end
  end
end
