# method for checking Y/N answer:
def check(text)
  loop do
    print text
    ans=gets.chomp.upcase
    if ['Y', 'YES'].include?(ans)
      return true
    elsif ['N', 'NO'].include?(ans)
      return false
    else
      print "Your answer is not correct. Pleas answer with 'Y' or 'N'\n"
    end
  end
end

# method to check wheather input is float (comas and dots allowed)
def float?(string)
  b = Float(string.tr(',', '.'))
  return b
rescue ArgumentError
  return false
end

# method to check wheather input is integer
def integer?(string)
  b = Integer(string)
  return b
rescue ArgumentError
  return false
end



# method for choosing from the list
def choice(range)
  input = ""
  loop do
    input = gets.chom
    if (input.to_i <= (range - 1)) && integer?(input)
      break
    elsif input == 'a'
      break
    else
      print 'chosen number is not within the range. '
      + 'Please choose again witch correct number: '
    end
  end
  input
end
