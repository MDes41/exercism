class Series

  def initialize(number_sequence)
    @number_sequence = number_sequence.chars.map(&:to_i)
  end

  def slices(number_slices)
    return raise ArgumentError if number_slices > @number_sequence.count
    @number_sequence.map.with_index do |num ,index|
      if index + number_slices <= @number_sequence.count
        @number_sequence[index..(index + number_slices - 1)]
      end
    end.compact
  end

end
