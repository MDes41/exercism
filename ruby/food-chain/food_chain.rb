class FoodChain

VERSION = 2

ANIMALS = {
          "fly" => "I don't know why she swallowed the fly. Perhaps she'll die.\n\n",
          "spider" => "It wriggled and jiggled and tickled inside her.\n",
          "bird" => "How absurd to swallow a bird!\n",
          "cat" => "Imagine that, to swallow a cat!\n",
          "dog" => "What a hog, to swallow a dog!\n",
          "goat" => "Just opened her throat and swallowed a goat!\n",
          "cow" => "I don't know how she swallowed a cow!\n",
          "horse" => "She's dead, of course!\n"
          }


  def self.song
    count = 0
    song = ''
    until count == 8
      animal = ANIMALS.keys[count]
      song << "I know an old lady who swallowed a #{animal}.\n#{ANIMALS[animal]}"
      song << add_what_she_swallowed(count) if count > 0 && count < 7
      song << ANIMALS["fly"] if count > 0 && count < 7
      count += 1
    end
    song
  end

  def self.add_what_she_swallowed(count)
    animals = ANIMALS.keys.take(count + 1)
    swallowed = ''
    until count == 0
      swallowed << "She swallowed the #{animals[count]} to catch the #{animals[count - 1]}"
      swallowed << ".\n" if count != 2
      swallowed << add_the_spider_info(swallowed) if count == 2
      count -= 1
    end
    swallowed
  end

  def self.add_the_spider_info(swallowed)
    spider_verse = ANIMALS["spider"].split
    spider_verse[0] = 'that'
    " #{spider_verse.join(' ')}\n"
  end




end
