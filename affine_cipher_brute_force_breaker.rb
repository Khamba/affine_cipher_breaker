class AffineCipherBruteForceBreaker

  attr_reader :cipher_text

  # All possible values of a with their inverses
  # All inverses are modulo 26
  # a * a_inverse = 1 mod 26
  # a has restriction gcd(a, 26) = 1
  A_WITH_INVERSE = {
    1 => 1,
    3 => 9,
    5 => 21,
    7 => 15,
    9 => 3,
    11 => 19,
    15 => 7,
    17 => 23,
    19 => 11,
    21 => 5,
    23 => 17,
    25 => 25,
  }

  # get the cipher text and save it in cipher_text instance variable
  # note: cipher_text can't be changed later
  def initialize(cipher_text)
    @cipher_text = cipher_text
  end

  def run
    counter = 1
    # We run for 10 times, ask user if any plaintext seems satisfactory
    # if not we run 10 times again
    A_WITH_INVERSE.each do |a, a_inverse|
      (0..25).each do |b|
        if counter < 11
          puts "a = #{a}, b = #{b}: plaintext = #{to_plaintext(b, a_inverse)}"
          counter +=1
        elsif counter == 11
          puts "---------------------------"
          puts "Is any of the above plaintext satisfactory? (Y/n)"
          input = gets.chomp
          if input == 'n' || input == 'N'
            counter = 1
          else
            counter += 1
          end
        else
          break
        end
      end
    end

    puts "Done."
  end

  private

    # x = (y - b) * a_inverse
    # y = cipher_text, x = plaintext
    def to_plaintext(b, a_inverse)
      plaintext = ""
      @cipher_text.each_char { |chr| plaintext << char_to_plaintext(chr, b, a_inverse) }
      return plaintext
    end

    def char_to_plaintext(chr, b, a_inverse)
      return int_to_char(((char_to_int(chr) - b) * a_inverse) % 26)
    end

    def char_to_int(chr)
      # "A".ord # => 65
      ord = chr.ord
      if ord >= 65 && ord < 65 + 26
        return ord - 65
      else
        raise "Ciphertext character is invalid. Only capital aplhabets are supported for now."
      end
    end

    def int_to_char(int)
      int %= 26
      return (int+65).chr
    end

end
