class MultiplicationTable
  attr_accessor :table

  def initialize(numbers)
    self.table = Array.new(numbers.count + 1).map {
      Array.new((numbers.count + 1))
    }
    table[0] = ['*', *numbers]
    numbers.each_with_index do |number, index|
      table[index + 1][0] = number
    end
    multiply
  end

  def show
    max_length = find_longest_number_length()
    table.each do |row|
      row.each do |number|
        printf("%#{max_length}s | ", number.to_s)
      end
      printf("\n")
    end
  end

  private

  def find_longest_number_length
    max_length = 0
    table.each do |row|
      row.each do |number|
        max_length = number.to_s.size if max_length < number.to_s.size
      end
    end
    max_length
  end

  def multiply
    size = table.count
    (size - 1).times do |x|
      (size - 1).times do |y|
        table[x + 1][y + 1] = table[0][x + 1] * table[y + 1][0]
      end
    end
  end
end
