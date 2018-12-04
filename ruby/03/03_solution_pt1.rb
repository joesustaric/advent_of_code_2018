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
        end
      end
    end
  end


  result = 0
  (0..(length-1)).each do |x|
    (0..(width-1)).each do |y|
      result += 1 if total_fabric[x][y] == :multiple
    end
  end

  result
end

puts fabric('input.txt',1000,1000)

# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                      master ◼
# bundle exec ruby 03_solution_pt1.rb  0.81s user 0.17s system 95% cpu 1.028 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                      master ◼
# bundle exec ruby 03_solution_pt1.rb  0.80s user 0.17s system 96% cpu 1.009 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                      master ◼
# bundle exec ruby 03_solution_pt1.rb  0.78s user 0.16s system 97% cpu 0.975 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                      master ◼
# bundle exec ruby 03_solution_pt1.rb  0.77s user 0.16s system 96% cpu 0.965 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                      master ◼
# bundle exec ruby 03_solution_pt1.rb  0.79s user 0.16s system 96% cpu 0.989 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                      master ◼
# bundle exec ruby 03_solution_pt1.rb  0.77s user 0.16s system 96% cpu 0.958 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                      master ◼
# bundle exec ruby 03_solution_pt1.rb  0.79s user 0.16s system 96% cpu 0.987 total
# ~/m/a/r/03 ❯❯❯ time bundle exec ruby 03_solution_pt1.rb                                                                      master ◼
# bundle exec ruby 03_solution_pt1.rb  0.80s user 0.17s system 96% cpu 0.999 total
