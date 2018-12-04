require 'rspec'
require_relative '02_solution_pt2'

describe '.box_id' do
  let(:input) do
    [
      'abcde',
      'fghij',
      'klmno',
      'pqrst',
      'fguij',
      'axcye',
      'wvxyz',
    ]
  end

  before do
    File.open('test_fixture.txt', 'w') do |file|
      input.each { |i| file.puts(i) }
    end
  end

  it 'generates the correct box id' do
    expect(box_id('test_fixture.txt')).to eq 'fgij'
  end

  after { File.delete('test_fixture.txt') if File.exist?('test_fixture.txt') }
end
