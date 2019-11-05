=begin
Make sure the tests check if victory and loss are correctly assessed
1. test to make sure players win when they should(3 tests)
2. Test all the critical methods to make sure they function properly and handle edge cases
3. Use mocks to isolate methods and make sure they are sending back the right methods
=end


require './lib/tic_tac_toe.rb'

describe TicTacToe do
  context 'win situation logic' do
    it 'tie sitaution' do 
    end

    it 'row filled' do 
    end

    it 'column filled' do 
    end

    it 'left diagonal' do
    end

    it 'right diagonal' do
    end

  end

  context '#put_x' do
    it 'puts x in correct position' do

    end

    context 'calls out illegal values' do
      it 'when postion is outside board' do
      end
      
      it 'when position is already taken' do 
      end
    end
  end

  context '#put_o' do
    it 'puts o in correct position' do
    end

    context 'calls out illegal values' do 
      it 'when position is outside board' do
      end

      it 'when position is already taken' do 
      end
    end
  end

  context 'methods send correct output' do
    it '#putX' do
    end

    it '#putO' do
    end

    it '#illegal' do
    end

    it '#left_diagonal_complete' do
    end

    it '#right_diagonal_complete'
  end

end