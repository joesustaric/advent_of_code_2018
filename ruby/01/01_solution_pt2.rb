#!/usr/bin/env ruby

require 'set'


class ResultFreq

  def initialize(current_freq:, delta:)
    @current_freq = current_freq
    @delta = delta
    @new_freq = current_freq + delta
  end

  attr_reader :current_freq, :delta, :new_freq
end

# parse input [ delta, delta, delta ]
def generate_input_as_hash(input_file_location)
  result = []
  File.readlines(input_file_location).each { |l| result << Integer(l) }
  result
end

def find_duplicate_freq(freq_set, input_deltas, starting_freq)
  current_freq = starting_freq

  input_deltas.each do |delta|
    r = ResultFreq.new(
      current_freq: current_freq,
      delta: delta
    )

    return r.new_freq if freq_set.include?(r.new_freq)

    current_freq = r.new_freq
    freq_set << r.new_freq
  end

  find_duplicate_freq(freq_set, input_deltas, current_freq)
end


puts find_duplicate_freq(Set.new, generate_input_as_hash('input.txt'), 0)
