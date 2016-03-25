class Complement

  VERSION = 3

  def self.check_valid_characters(first_letter)
    first_letter.chars.all? do |letter|
      ["C", "G", "T", "A"].include?(letter)
    end
  end

  def self.of_dna(first_letter)
    if !check_valid_characters(first_letter)
      return raise ArgumentError
    end
    first_letter.tr("CGTA", "GCAU")
  end


end
