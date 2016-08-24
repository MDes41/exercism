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
    @rows = @groups.count
    @groups.map { |group| group.join }
  end

  def ciphertext
    group_text.compact.join
  end

  def normalize_ciphertext
    sub_nil.each_slice(@rows).to_a.map { |segment| segment.join }.join(' ').gsub("*", "")
  end

  def fill_table
    @text = group_text.compact.join
  end

  def sub_nil
    text = group_text.compact
    extra = text.count % (@rows + 1)
    if extra != 0
      add_extra_chars(text, extra)
    else
      text
    end
  end

  def add_extra_chars(text, extra)
    extra = @rows - extra
    breaks = -(@rows)
    extra_char = [-1]
    extra.times do |index|
      extra_char << breaks
      breaks -= (@rows -1)
    end
    extra_char.reverse.each do |index|
      text = text.insert(index, '*')
    end
    text
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
