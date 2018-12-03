#!/usr/bin/env ruby


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


pos_set, neg_set = parse_data_sets('input.txt')

puts calculate_result(pos_set, neg_set)
