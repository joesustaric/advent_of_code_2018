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

def generate_input_as_hash(input_file_location)
  result = []
  File.readlines(input_file_location).each { |l| result << Integer(l) }
  result
end

def find_duplicate_freq(freq_set, input_deltas, previous_freq)
  current_freq = previous_freq

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

# bundle exec ruby 01_solution_pt2.rb  0.61s user 0.12s system 97% cpu 0.752 total
# ~/m/a/r/01 ❯❯❯ time bundle exec ruby 01_solution_pt2.rb                                                                                                                                              master
# bundle exec ruby 01_solution_pt2.rb  0.64s user 0.13s system 96% cpu 0.796 total
# ~/m/a/r/01 ❯❯❯ time bundle exec ruby 01_solution_pt2.rb                                                                                                                                              master
# bundle exec ruby 01_solution_pt2.rb  0.64s user 0.13s system 97% cpu 0.790 total
# ~/m/a/r/01 ❯❯❯ time bundle exec ruby 01_solution_pt2.rb                                                                                                                                              master
# bundle exec ruby 01_solution_pt2.rb  0.73s user 0.13s system 94% cpu 0.910 total
# ~/m/a/r/01 ❯❯❯ time bundle exec ruby 01_solution_pt2.rb                                                                                                                                              master
# bundle exec ruby 01_solution_pt2.rb  0.61s user 0.13s system 97% cpu 0.762 total
# ~/m/a/r/01 ❯❯❯ time bundle exec ruby 01_solution_pt2.rb                                                                                                                                            master ✱
# bundle exec ruby 01_solution_pt2.rb  0.61s user 0.12s system 94% cpu 0.773 total
