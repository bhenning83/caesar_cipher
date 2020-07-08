print "Enter message here: "
message = gets.chomp.downcase.split("")
print "Enter shift key: "
shift_value = gets.chomp.to_i

#make hash with a-z assigned to 1-26
letter_keys = Array("a".."z")
num_values = Array(1..26)
letter_number_converter = letter_keys.zip(num_values).to_h

#convert each letter in array to number and add shift
translated_array = message.map do|letter| 
    if letter.match(/^[[:alpha:]]$/)
        letter_number_converter[letter] + shift_value
    else 
        letter
    end
end

#wrap from A to A if necessary
encrypted_array = translated_array.map do |number| 
    if !(number.is_a? Numeric)
        number
    elsif number > 26
        number -= 26
    end
    number
end
    
#convert encrypted number sequence back to letters
encrypted_message = encrypted_array.map do |number|
  if !(number.is_a? Numeric)
      number
  else
   letter_number_converter.key(number)
  end
end
print "Your encrpyted message is: "
puts encrypted_message.join
