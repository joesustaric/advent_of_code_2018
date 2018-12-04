require 'rspec'
require_relative '03_solution_pt1'

describe '.fabric' do

  context 'Given a set of inputs' do
    let(:input) do
      [
        '#1 @ 1,3: 4x4',
        '#2 @ 3,1: 4x4',
        '#3 @ 5,5: 2x2',
      ]
    end

    before do
      File.open('test_fixture.txt', 'w') do |file|
        input.each { |i| file.puts(i) }
      end
    end

    it 'calcualtes the how many sq inches of fabric have 2 or more claims' do
      expect(fabric('test_fixture.txt',8,8)).to eq 4
    end

    after { File.delete('test_fixture.txt') if File.exist?('test_fixture.txt') }
  end

end
