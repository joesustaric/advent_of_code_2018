#!/usr/bin/env ruby

require 'pry'

class Claim
  def initialize(input)
    @input = input.strip
    @locations = []
  end

  attr_accessor :locations

  def overlaps_another_claim?
    @locations.each { |location| return true if location.state == :multiple }
    false
  end

  def claim_number
    @number ||= @input.split(':')[0].split('@')[0].tr('#','').strip.to_i
  end

  def length
    @length ||= @input.split(':')[1].strip.split('x')[0].to_i - 1
  end

  def width
    @width ||= @input.split(':')[1].strip.split('x')[1].to_i - 1
  end

  def inches_from_left_edge
    @from_left ||= @input.split(':')[0].split('@')[1].strip.split(',')[0].to_i
  end

  def inches_from_top_edge
    @from_top ||= @input.split(':')[0].split('@')[1].strip.split(',')[1].to_i
  end
end

class Location
  def initialize()
    @state = :empty
  end

  attr_accessor :state
end

def load_file(file_name)
  result = []
  File.readlines(file_name).each { |line| result << line }
  result
end

def init_fabric_state(length, width)
  Array.new(length) { Array.new(width) { Location.new } }
end

def winning_claim(input_file, length, width)
  total_fabric = init_fabric_state(length, width)
  input = load_file(input_file)
  claims = []

  input.each do |line|
    claim = Claim.new(line)

    (0..claim.length).each do |y_offset|
      x = claim.inches_from_left_edge + y_offset

      (0..claim.width).each do |x_offset|
        y = claim.inches_from_top_edge + x_offset

        if total_fabric[x][y].state == :empty
          total_fabric[x][y].state = :single
        elsif total_fabric[x][y].state == :single
          total_fabric[x][y].state = :multiple
        end

        claim.locations << total_fabric[x][y]
      end
    end
    claims << claim
  end

  claims.each do |claim|
    return claim.claim_number unless claim.overlaps_another_claim?
  end
end

puts winning_claim('input.txt',1000,1000)

# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt2.rb                                                                                                                                       ✘ 15 master ◼
# bundle exec ruby 03_solution_pt2.rb  0.91s user 0.17s system 97% cpu 1.107 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt2.rb                                                                                                                                            master ◼
# bundle exec ruby 03_solution_pt2.rb  0.88s user 0.16s system 97% cpu 1.076 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt2.rb                                                                                                                                            master ◼
# bundle exec ruby 03_solution_pt2.rb  0.91s user 0.17s system 97% cpu 1.097 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt2.rb                                                                                                                                            master ◼
# bundle exec ruby 03_solution_pt2.rb  0.91s user 0.17s system 97% cpu 1.116 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt2.rb                                                                                                                                            master ◼
# bundle exec ruby 03_solution_pt2.rb  0.91s user 0.16s system 97% cpu 1.107 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt2.rb                                                                                                                                            master ◼
# bundle exec ruby 03_solution_pt2.rb  0.91s user 0.16s system 98% cpu 1.095 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt2.rb                                                                                                                                            master ◼
# bundle exec ruby 03_solution_pt2.rb  0.90s user 0.16s system 97% cpu 1.086 total
