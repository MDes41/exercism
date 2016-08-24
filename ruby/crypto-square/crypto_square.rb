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
    @columns = columns
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

  def fill_table
    @text = group_text.compact.join
  end

  def sub_nil
    text = group_text.compact
    extra = text.count % (@rows + 1)
    breaks = []
    br = @rows
    extra.times do
      breaks << br
      br += @rows
    end
    if extra == 0
      @rows.times do
        breaks << br
        br += @rows
      end
    else
      (@rows - extra).times do
        breaks << br
        br += @rows - 1
      end
    end
    require "pry"; binding.pry

    # result = []
    # until index == text.count - @
    #   result << text[index..@rows]
    #   extra
    # # subs = text.count - group_text.count
    # result = (1..(@rows + 1)).to_a.map { |i| [] }
    # index = 0
    # require "pry"; binding.pry
    # text.each do |char|
    #   if index < @rows
    #     result[index] << char
    #     index += 1
    #   else
    #     result[index] << char
    #     index = 0
    #   end
    # end
    # until subs == 0
    #   result << "*"
    #   subs +=1
    # end
    # result.join
    # require "pry"; binding.pry
    result.join
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
