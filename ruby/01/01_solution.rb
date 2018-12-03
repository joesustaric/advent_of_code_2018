#!/usr/bin/env ruby

# 1st Try
def calculate_result(positive_set, negative_set)
  positive_result = positive_set.inject(0) do |sum, (delta, multiple)|
    sum += (delta * multiple)
  end

  negative_result = negative_set.inject(0) do |sum, (delta, multiple)|
    sum += (delta * multiple)
  end

  positive_result - negative_result
end

def parse_data_sets(input_file_location)
  pos_set, neg_set = {}, {}

  File.readlines(input_file_location).each do |line|
    int = Integer(line)

    if int.positive?
      pos_set.key?(int) ? pos_set[int] = pos_set[int] + 1 : pos_set[int] = 1
    else
      int = int.abs
      neg_set.key?(int) ? neg_set[int] = neg_set[int] + 1 : neg_set[int] = 1
    end
  end

  [pos_set, neg_set]
end

# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                   master
# ruby 01_solution.rb  0.11s user 0.06s system 90% cpu 0.189 total
# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                   master
# ruby 01_solution.rb  0.11s user 0.06s system 87% cpu 0.199 total
# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                   master
# ruby 01_solution.rb  0.12s user 0.06s system 87% cpu 0.201 total
# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                   master
# ruby 01_solution.rb  0.11s user 0.06s system 92% cpu 0.182 total
# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                   master
# ruby 01_solution.rb  0.11s user 0.06s system 90% cpu 0.185 total

# pos_set, neg_set = parse_data_sets('input.txt')
# puts calculate_result(pos_set, neg_set)

#2nd Try - straight up...

def calc_result(input_file_location)
  result = 0
  File.readlines(input_file_location).each do |line|
    int = Integer(line)
    result += int
  end
  result
end

# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                 master ✱
# ruby 01_solution.rb  0.11s user 0.06s system 91% cpu 0.187 total
# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                 master ✱
# ruby 01_solution.rb  0.11s user 0.06s system 92% cpu 0.189 total
# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                 master ✱
# ruby 01_solution.rb  0.11s user 0.06s system 92% cpu 0.189 total
# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                 master ✱
# ruby 01_solution.rb  0.12s user 0.06s system 89% cpu 0.202 total
# ~/m/a/r/01 ❯❯❯ time ruby 01_solution.rb                                                                                 master ✱
# ruby 01_solution.rb  0.11s user 0.06s system 92% cpu 0.185 total

# puts calc_result('input.txt')
