#looks like it is the index of an array of squares
#first need to create the array of squares
#then need to find the index of the array of squares for the number asked
#refactor so that you only create the array up to the count of the number


class Grains
  def self.square(number)
    array_of_squares(number)
  end

  def self.array_of_squares(number)
    array = [1]
    until array.count == number
      array << array.last * 2
    end
    @total = array.reduce(:+)
    array.last
  end

  def self.total
    @total
  end
end
