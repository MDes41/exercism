class Nucleotide

  attr_reader :dna, :histogram

  def initialize
    @histogram ||= gather_nucleotides
  end

  def self.from_dna(dna)
    raise ArgumentError if dna.scan(/[^ATCG]/).length > 0
    new.add_dna(dna)
  end

  def gather_nucleotides
    %w(A T C G).each_with_object({}) { |str, hsh| hsh[str] = 0 }
  end

  def count(nucleotide)
    histogram[nucleotide]
  end

  def add_dna(dna)
    dna.split('').each do |letter|
      histogram[letter] += 1 if histogram[letter]
    end
    self
  end
end
