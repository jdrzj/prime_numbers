$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'lib/generate_primes'
require 'lib/multiplication_table'

require 'pry'

size = (ARGV[0] || 10).to_i

numbers = GeneratePrimes.get_primes(size)
MultiplicationTable.new(numbers).show
