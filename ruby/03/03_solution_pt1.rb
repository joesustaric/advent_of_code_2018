#!/usr/bin/env ruby

require 'pry'

class Claim
  def initialize(input)
    @input = input.strip
  end

  def length
    @length ||= @input.split(':')[1].strip.split('x')[0].to_i
  end

  def width
    @width ||= @input.split(':')[1].strip.split('x')[1].to_i
  end

  def inches_from_left_edge
    @from_left ||= @input.split(':')[0].split('@')[1].strip.split(',')[0].to_i
  end

  def inches_from_top_edge
    @from_top ||= @input.split(':')[0].split('@')[1].strip.split(',')[1].to_i
  end
end

def load_file(file_name)
  result = []
  File.readlines(file_name).each { |line| result << line }
  result
end

def fabric(input_file, length, width)
  result = 0
  total_fabric = Array.new(length) { Array.new(width, :empty) }

  input = load_file(input_file)

  input.each do |line|
    claim = Claim.new(line)

    (0..(claim.length-1)).each do |add_to_length|

      (0..(claim.width-1)).each do |add_to_width|
        x = claim.inches_from_left_edge + add_to_length
        y = claim.inches_from_top_edge + add_to_width

        if total_fabric[x][y] == :empty
          total_fabric[x][y] = :single
        elsif total_fabric[x][y] == :single
          total_fabric[x][y] = :multiple
          result += 1
        end
      end
    end
  end

  result
end

puts fabric('input.txt',1000,1000)
#
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                    master ✱ ◼
# bundle exec ruby 03_solution_pt1.rb  0.74s user 0.17s system 96% cpu 0.939 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                    master ✱ ◼
# bundle exec ruby 03_solution_pt1.rb  0.72s user 0.16s system 96% cpu 0.916 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                    master ✱ ◼
# bundle exec ruby 03_solution_pt1.rb  0.74s user 0.17s system 96% cpu 0.942 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                    master ✱ ◼
# bundle exec ruby 03_solution_pt1.rb  0.75s user 0.17s system 96% cpu 0.948 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                    master ✱ ◼
# bundle exec ruby 03_solution_pt1.rb  0.73s user 0.16s system 96% cpu 0.926 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                    master ✱ ◼
# bundle exec ruby 03_solution_pt1.rb  0.67s user 0.15s system 96% cpu 0.846 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                    master ✱ ◼
# bundle exec ruby 03_solution_pt1.rb  0.70s user 0.16s system 96% cpu 0.894 total
