# tests for 6 of the methods(multiple tests for each method)

require './lib/enumerable_methods'

describe 'Enumerable Module' do
  context '#my_each' do

    it 'array size is 0' do
      counter = true
      [].my_each {counter = false}
      expect(counter)
    end

    it 'block provided works correctly' do
      sum = 0
      [1,2,3,4,5].my_each{ |element| sum+=element}
      expect(sum).to eq 15
    end

    it 'No block given' do 
      expect([1,2,3,4,5].my_each).to eq(nil)
    end
  end

  context '#my_select' do 
    it 'empty array provided' do
      expect([].my_select{}).to eq([])
    end

    it 'No block given' do
      expect([1,2,3,4].my_select).to eq ([1,2,3,4])
    end

    it 'Block executes' do
      expect([1,2,3,4].my_select {|element| 
        element%2 != 0
      }).to eq [1,3]
    end
  end

  context '#my_all?' do
    it 'no block given' do
      expect([1,2,3,4].my_all?10).to eq(false)
    end

    it 'no elements match' do
      expect(result = [1,2,3,4].my_all?{|element|
      (element**2)%10 == 5
    }).to eq (false)
    end

    it 'all elements match' do
      expect([1,2,3,4].my_all?{|element|
        element<5
    }).to eq(true)
    end

    it 'some elements match' do 
      expect([1,2,3,4].my_all?{|element|
      element == 4
    }).to eq(false)
    end
  end

  context '#my_any' do
    it 'no block given' do
      expect([1,2,3,4].my_any?4).to eq(true)
    end

    it 'no elements match' do
      expect([1,2,3,4].my_any?{|element|
      (element**2) %10 == 5
    }).to eq(false)
    end

    it 'all elements match' do 
      expect([1,2,3,4].my_any?{
        |element|
        element<=4
      }).to eq(true)
    end

    it 'some elements match' do
      expect([1,2,3,4].my_any?{
        |element|
        element<4
      }).to eq(true)
    end
  end

  context '#my_none' do
    it 'no block given' do
      expect([1,2,3,4].my_none?2).to eq(false)
    end

    it 'no elements match' do
      expect([1,2,3,4].my_none?{ |element|
      element == 0
      }).to eq(true)
    end

    it 'all elements match' do
      expect([1,2,3,4].my_none?{|element|
      element<5
    }).to eq(false)
    end

    it 'some elements match' do
      expect([1,2,3,4].my_none?{
        |element|
        element % 2 == 0
      }).to eq(false)
    end
  end
end