require_relative './affine_cipher_brute_force_breaker'

puts "Welcome..."
puts "Enter the cipher text"
cipher_text = gets.chomp

affine_cipher_brute_force_breaker = AffineCipherBruteForceBreaker.new(cipher_text)

affine_cipher_brute_force_breaker.run
