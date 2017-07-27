require_relative 'hexadecimal'

RSpec.describe Hexadecimal do
  context '#to_decimal' do
    it 'responds to method' do
      hd = Hexadecimal.new('a')

      expect(hd).to respond_to(:to_decimal)
    end

    it 'converts the ones place' do
      result = []
      result << Hexadecimal.new('1').to_decimal
      result << Hexadecimal.new('2').to_decimal
      result << Hexadecimal.new('3').to_decimal
      result << Hexadecimal.new('4').to_decimal
      result << Hexadecimal.new('5').to_decimal
      result << Hexadecimal.new('6').to_decimal
      result << Hexadecimal.new('7').to_decimal
      result << Hexadecimal.new('8').to_decimal
      result << Hexadecimal.new('9').to_decimal
      result << Hexadecimal.new('a').to_decimal
      result << Hexadecimal.new('b').to_decimal
      result << Hexadecimal.new('c').to_decimal
      result << Hexadecimal.new('d').to_decimal
      result << Hexadecimal.new('e').to_decimal
      result << Hexadecimal.new('f').to_decimal

      expect(result).to eq([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])
    end
  end
end
