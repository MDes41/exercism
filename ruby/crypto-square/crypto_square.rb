class Crypto

  def  initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.downcase.gsub(/[^1-9A-Za-z]/, '')
  end

  def size
    rows = 1
    slice = 0
    phrase = normalize_plaintext
    columns = phrase.length
    until columns - rows <= 1 && columns >= rows
      slice += 1
      @groups = phrase.chars.each_slice(slice).to_a
      rows = @groups.count
      columns = @groups[0].join.length
    end
    columns
  end

  def plaintext_segments
    size
    @groups.map { |group| group.join }
  end

  def ciphertext
    group_text.join
  end

  def normalize_ciphertext
    group_text.join(" ")
  end

  def group_text
    (0..(size - 1)).map.with_index do |group, index|
      group = []
      plaintext_segments.each do |segment|
        group << segment[index]
      end
      group.compact.join
    end
  end

end
