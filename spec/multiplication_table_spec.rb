$LOAD_PATH.unshift(File.dirname(File.dirname(__FILE__)))
require 'lib/multiplication_table'
require 'pry'

RSpec.describe MultiplicationTable do
  it 'multiplies correctly' do
    numbers = [1, 2, 3]
    result = [
      ['*', 1, 2, 3],
      [1,   1, 2, 3],
      [2,   2, 4, 6],
      [3,   3, 6, 9]
    ]
    table = MultiplicationTable.new(numbers)
    expect(table.table).to eq(result)
  end

  it 'find longest number in table' do
    numbers = [1, 2, 3]
    table = MultiplicationTable.new(numbers)
    table.table = [
      [1,  2,      3],
      [11, 1,      3],
      [1,  12_345, 4]
    ]
    longest_number_length = table.send(:find_longest_number_length)
    expect(longest_number_length).to eq(12_345.to_s.size)
  end

  it 'shows table correctly' do
    numbers = [10, 2, 11]
    table = MultiplicationTable.new(numbers)
    expected_output = "  * |  10 |   2 |  11 | \n 10 | 100 |  20 | 110 | \n  2 |  20 |   4 |  22 | \n 11 | 110 |  22 | 121 | \n"
    table_show_stdout = capture_stdout do
      table.show
    end
    expect { table.show }.to output.to_stdout
    expect(table_show_stdout).to eq(expected_output)
  end

  def capture_stdout
    old_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = old_stdout
  end
end
