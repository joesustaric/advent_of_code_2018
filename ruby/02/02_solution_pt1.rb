#!/usr/bin/env ruby

def checksum(input_file)
  input = load_file(input_file)

  double_letter_matches, triple_letter_matches = 0, 0

  input.each do |barcode|
    has_2, has_3 = false, false

    barcode.strip.split(//).uniq.each do |letter|
      has_2 = matching_letters_n_times(barcode.strip, letter, 2) unless has_2
      has_3 = matching_letters_n_times(barcode.strip, letter, 3) unless has_3
      break if has_2 && has_3
    end

    double_letter_matches += 1 if has_2
    triple_letter_matches += 1 if has_3
  end

  double_letter_matches * triple_letter_matches
end

def matching_letters_n_times(input_string, letter, exact_number_of_matches)
  return input_string.scan(/#{letter}/m).size == exact_number_of_matches
end


def load_file(file_name)
  result = []
  File.readlines(file_name).each { |line| result << line }
  result
end

puts checksum('input.txt')

# ~/m/a/r/02 ❯❯❯ time bundle exec ruby 02_solution_pt1.rb                                                                                                                                          master ⬆ ◼
# bundle exec ruby 02_solution_pt1.rb  0.46s user 0.13s system 92% cpu 0.639 total
# ~/m/a/r/02 ❯❯❯ time bundle exec ruby 02_solution_pt1.rb                                                                                                                                          master ⬆ ◼
# bundle exec ruby 02_solution_pt1.rb  0.43s user 0.11s system 94% cpu 0.572 total
# ~/m/a/r/02 ❯❯❯ time bundle exec ruby 02_solution_pt1.rb                                                                                                                                          master ⬆ ◼
# bundle exec ruby 02_solution_pt1.rb  0.46s user 0.12s system 96% cpu 0.601 total
# ~/m/a/r/02 ❯❯❯ time bundle exec ruby 02_solution_pt1.rb                                                                                                                                          master ⬆ ◼
# bundle exec ruby 02_solution_pt1.rb  0.44s user 0.13s system 96% cpu 0.592 total
# ~/m/a/r/02 ❯❯❯ time bundle exec ruby 02_solution_pt1.rb                                                                                                                                          master ⬆ ◼
# bundle exec ruby 02_solution_pt1.rb  0.45s user 0.12s system 92% cpu 0.615 total
# ~/m/a/r/02 ❯❯❯ time bundle exec ruby 02_solution_pt1.rb                                                                                                                                          master ⬆ ◼
# bundle exec ruby 02_solution_pt1.rb  0.45s user 0.12s system 96% cpu 0.590 total
