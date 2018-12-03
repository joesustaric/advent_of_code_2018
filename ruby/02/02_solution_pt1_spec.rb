require 'rspec'
require_relative '02_solution_pt1'

describe '.cheksum' do

  context 'Given a set of inputs' do
    let(:input) do
      [
        'abcdef',
        'bababc',
        'abbcde',
        'abcccd',
        'aabcdd',
        'abcdee',
        'ababab',
      ]
    end

    before do
      File.open('test_fixture.txt', 'w') do |file|
        input.each { |i| file.puts(i) }
      end
    end

    it 'calculates the correct checksum' do
      expect(checksum('test_fixture.txt')).to eq 12
    end

    after { File.delete('test_fixture.txt') if File.exist?('test_fixture.txt') }
  end

end
