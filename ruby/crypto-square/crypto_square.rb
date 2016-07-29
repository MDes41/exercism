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
    multiplyer = 0
    slice = 0
    columns = phrase.length
    require "pry"; binding.pry
    until columns - rows <= 1 && columns <= rows
      slice += 1
      rows = phrase.chars.each_slice(slice).to_a
      columns = rows[0].join.length
      require "pry"; binding.pry
    end
    rows.count
  end
end
