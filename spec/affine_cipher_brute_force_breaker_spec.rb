require_relative '../affine_cipher_brute_force_breaker'

describe AffineCipherBruteForceBreaker do
  before(:each) do
    @affine_cipher_brute_force_breaker = AffineCipherBruteForceBreaker.new("GKUZKRH")
  end

  context "#char_to_int" do
    it "maps A to 0" do
      expect(@affine_cipher_brute_force_breaker.send(:char_to_int, "A")).to eq(0)
    end

    it "maps U to 20" do
      expect(@affine_cipher_brute_force_breaker.send(:char_to_int, "U")).to eq(20)
    end

    it "maps N to 13" do
      expect(@affine_cipher_brute_force_breaker.send(:char_to_int, "N")).to eq(13)
    end

    it "throws error if argument is not capital alphabet" do
      expect {
        @affine_cipher_brute_force_breaker.send(:char_to_int, "@")
      }.to raise_error(RuntimeError)
    end
  end

  context "#int_to_char" do
    it "maps 0 to A" do
      expect(@affine_cipher_brute_force_breaker.send(:int_to_char, 0)).to eq("A")
    end

    it "maps 20 to U" do
      expect(@affine_cipher_brute_force_breaker.send(:int_to_char, 20)).to eq("U")
    end

    it "maps 13 to N" do
      expect(@affine_cipher_brute_force_breaker.send(:int_to_char, 13)).to eq("N")
    end

    it "maps 63 to L by modulo 26" do
      expect(@affine_cipher_brute_force_breaker.send(:int_to_char, 63)).to eq("L")
    end
  end

  context "#to_plaintext" do
    it "maps GKUZKRH to SAURABH, b = 10, a_inverse = 15" do
      # Here a = 7, b = 10
      # SAURABH is the author's name, not some random string
      # Remeber y = a.x + b mod 26
      expect(@affine_cipher_brute_force_breaker.send(:to_plaintext, 10, 15)).to eq("SAURABH")
    end
  end
end
