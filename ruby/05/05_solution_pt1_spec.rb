require 'rspec'
require_relative '05_solution_pt1'

describe '.foo' do

let(:input) { 'dabAcCaCBAcCcaDA' }

it { expect(foo(input)).to eq 'dabCBAcaDA' }

end
