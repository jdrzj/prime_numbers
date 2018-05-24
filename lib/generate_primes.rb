class GeneratePrimes
  def self.get_primes(count)
    primes = []
    n = 2
    loop do
      primes << n if prime?(n)
      break if primes.count == count
      n += 1
    end
    primes
  end

  def self.prime?(number)
    return false if number <= 1
    2.upto(Math.sqrt(number).to_i) do |x|
      return false if (number % x).zero?
    end
    true
  end
end
