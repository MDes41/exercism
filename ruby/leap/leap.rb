#if it's divisable by 4 it is a leap year.
#except if it is divisable by 100 and not 400
#if it is divisable by 100 and 400 it is a leap year
#first see if it is divisable by 4.
#then go to a second condition that checks for diviable by 100 and 400

#changed all refute in test to assert, since you are not giving true false

class Year
  VERSION = 1

  def self.leap?(year)
    if year % 4 == 0
      exception?(year)
    else
      "No, #{year} is not a leap year"
    end
  end

  def self.exception?(year)
    if year % 100 == 0 && year % 400 != 0
      "No, #{year} is not a leap year"
    else
      "Yes, #{year} is a leap year"
    end
  end

end
