$LOAD_PATH.unshift(File.dirname(File.dirname(__FILE__)))
require 'lib/generate_primes'

RSpec.describe GeneratePrimes do
  it 'generate N primes' do
    N = 20
    # https://en.wikipedia.org/wiki/List_of_prime_numbers#The_first_1000_prime_numbers
    first_20_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71]

    generated_primes = GeneratePrimes.get_primes(N)
    expect(generated_primes).to eq(first_20_primes)
  end

  it 'check if number is prime' do
    primes = [4507, 4513, 4517, 4519, 31337]
    not_primes = [4, 8, 100, 1337, 100_000]

    primes.each do |prime|
      expect(GeneratePrimes.prime?(prime)).to eq(true)
    end

    not_primes.each do |not_prime|
      expect(GeneratePrimes.prime?(not_prime)).to eq(false)
    end
  end
end
