#!/usr/bin/env ruby

require 'pry'


def load_file(file_name)
  result = []
  File.readlines(file_name).each { |line| result << line.strip }
  result
end

def foo(input)
  input_array = input.split('')
  result = []
  index = 0
  while input_array[index + 1] != nil do
    if input_array[index] == input_array[index + 1].swapcase
      input_array.delete_at(index)
      input_array.delete_at(index)
      index -= 1 if index > 0
      next
    end
    index += 1
  end

  return input_array.size
end

puts foo(load_file('input.txt')[0])
