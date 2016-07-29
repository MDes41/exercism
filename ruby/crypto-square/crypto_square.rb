class Crypto

  def  initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.downcase.gsub(/[^1-9A-Za-z]/, '')
  end

  def size
    rows = 1
    phrase = normalize_plaintext
    slice = 0
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
    @rows = @groups.count
    @groups.map { |group| group.join }
  end

  def ciphertext
    group_text.compact.join
  end

  def normalize_ciphertext
    sub_nil.chars.each_slice(@rows).to_a.map { |segment| segment.join }.join(' ')
  end

  def sub_nil
    result = group_text.compact
    subs = result.count - group_text.count
    until subs == 0
      result[subs][-1] = "*"
      subs +=1
    end
    result
  end

  def group_text
    index = 0
    result = []
    until index == size
      plaintext_segments.each do |segment|
        result << segment[index]
      end
      index += 1
    end
    result
  end
end
