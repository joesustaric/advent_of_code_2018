#!/usr/bin/env ruby
require 'pry'

def load_file(file_name)
  result = []
  File.readlines(file_name).each { |line| result << line }
  result
end

def box_id(input_filename)
  input = load_file(input_filename)
  result = ''
  loop_counter = 0
  last_index_of_input = input.size - 1

  found_1_letter_diftimef_match = false

  input.each do |barcode_1|
    loop_counter += 1
    barcode_1_array = barcode_1.strip.split(//)


    (loop_counter..last_index_of_input).each do |index|
      barcode_2_array = input[index].strip.split(//)

      if diff_is_1_character?(barcode_1_array, barcode_2_array)
        return box_id_without_diff_char(barcode_1_array, barcode_2_array)
      end
    end
  end
end

def diff_is_1_character?(array1, array2)
  diffs = 0
  char_index = 0
  loop_2_finish = array2.size - 1

  array1.each do |char_1|
    char_2 = array2[char_index]

    if char_1 != char_2
      diffs += 1
    end
    char_index += 1

    break if diffs > 2
  end

  (diffs == 1)
end

def box_id_without_diff_char(array1, array2)
  letter_to_exclude = (array1 - array2).first

  return array1.join().gsub(/#{letter_to_exclude}/,'')
end

puts box_id('input_pt2.txt')
