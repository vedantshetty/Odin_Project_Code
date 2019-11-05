#Create 6 tests

require './lib/caesar.rb'

describe '#caesar_cipher' do

  it 'Performs a basic +ve shift' do
    expect(caesar_cipher('Hi my name is vedant',3)).to eq('Kl pb qdph lv yhgdqw')
  end

  it 'Performs a basic -ve shift' do
    expect(caesar_cipher('Hi my name is vedant',-3)).to eq('Ef jv kxjb fp sbaxkq')
  end

  it '+ve shift rolling over back to start' do
    expect(caesar_cipher('Hi my name is vedant',10)).to eq('Rs wi xkwo sc fonkxd')
  end

  it '-ve shift rolling over to end' do 
    expect(caesar_cipher('WHEN THE GOING GETS TOUGH THE TOUGH GET GOING',-8)).to eq('OZWF LZW YGAFY YWLK LGMYZ LZW LGMYZ YWL YGAFY')
  end

  it 'Can shift uppercase and lowercase' do
    expect(caesar_cipher('NeEd To GeT wOrK dOnE qUiCkLy',5)).to eq('SjJi Yt LjY bTwP iTsJ vZnHpQd')
  end

  it 'case where lower case shifts to uppercase' do 
    expect(caesar_cipher('zebra crossing',14)).to eq('nspfo qfcggwbu')
  end
end