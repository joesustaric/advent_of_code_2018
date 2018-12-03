require 'rspec'
require_relative '01_solution'

describe '.calculate_result' do

  context 'Given a random delta dataset' do
    let(:positive_number_data_set) do
      {
        2 => 3,
        1 => 1,
        99 => 3,
        66 => 2,
      }
    end

    let(:neg_number_data_set) do
      {
        2 => 3,
        1 => 1,
        28 => 5,
        12 => 2,
      }
    end
    let(:result) { 265 }

    it 'calcualtes the correct result' do
      expect(calculate_result(positive_number_data_set, neg_number_data_set)).to eq result
    end
  end

  describe '.parse_data_sets' do
    context 'Given some random positive and negative input data' do
      let(:input_data) do
        ['-1','-2','-3','+4','+5','+6','-3','-1','+4','+4']
      end
      let(:positive_result_set) do
        {
          4 => 3,
          5 => 1,
          6 => 1,
        }
      end
      let(:negative_result_set) do
        {
          1 => 2,
          2 => 1,
          3 => 2,
        }
      end

      before do
        File.open('test_fixture.txt', 'w') do |file|
          input_data.each { |i| file.puts(i) }
        end
      end


      it 'creates the right parsed data sets' do
        positive_set, negative_set = parse_data_sets('test_fixture.txt')

        expect(positive_set).to eq positive_result_set
        expect(negative_set).to eq negative_result_set
      end

      after { File.delete('test_fixture.txt') if File.exist?('test_fixture.txt') }
    end
  end
end
