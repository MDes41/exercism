class BeerSong

  def verse(bottles)
    if bottles <= 0
      bottles = "No more"
      verse = "Go to the store and buy some more"
    else
      verse = "Take #{one_or_many(bottles)[1]} down and pass it around"
    end
      "#{bottles} #{one_or_many(bottles)[0]} of beer on the wall, #{bottles.to_s.downcase} #{one_or_many(bottles)[0]} of beer.\n" \
      "#{verse}, #{bottles_left(bottles)} of beer on the wall.\n"
  end

  def verses(verse1, verse2)
    "#{verse(verse1)}\n#{verse(verse2)}"
  end

  def lyrics
    result = []
    100.times do |bottle|
      bottle - 1
      result << verse(99 - bottle)
    end
    result.join("\n")
  end

  def one_or_many(bottles)
    bottle = [ 'bottles', 'one' ]
    bottle = [ 'bottle', 'it' ] if bottles == 1
    bottle
  end

  def bottles_left(bottles)
    if bottles == 2
      "1 bottle"
    elsif bottles == 1
      "no more bottles"
    elsif bottles == "No more"
      "99 bottles"
    else
      "#{bottles - 1 } bottles"
    end
  end

end
