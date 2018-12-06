#!/usr/bin/env ruby

require 'pry'
require 'time'

# time = Time.parse(input.match(/\d+-\d+-\d+ \d+:\d+/).to_s)

class Guard
  def initialize(input)
    @guard_create_string = input
    @awake = {}
    @asleep = {}
    awake_from(input)
  end

  attr_accessor :asleep, :awake

  def guard_number
    @number ||= @guard_create_string.split(' ')[3].tr('#','').strip.to_i
  end

  def start_sleeping(input)
    @start_sleeping = Time.parse(input.match(/\d+-\d+-\d+ \d+:\d+/).to_s)
  end

  def start_sleeping(input)
    @start_sleeping = Time.parse(input.match(/\d+-\d+-\d+ \d+:\d+/).to_s)
  end

  def awake_from(input)
    @last_awake_from = Time.parse(input.match(/\d+-\d+-\d+ \d+:\d+/).to_s)
  end

  def self.find_or_create(guards, input)
    guard = nil
    if guards.empty?
      guard = Guard.new(input)
      guards << guard
      return guard
    end

    if new_guard?(input)
      id = input.split(' ')[3].tr('#','').strip.to_i
      guards.each { |g| guard = g if g.guard_number == id }
      guard = Guard.new(input) if guard.nil?
      guards << guard
      return guard
    end

    guards.last
  end

  def set_awake_times(input)
    start_sleeping_at = Time.parse(input.match(/\d+-\d+-\d+ \d+:\d+/).to_s)

    (@last_awake_from.min..(start_sleeping_at.min - 1)).each do |awake_min|
      @awake[awake_min].nil? ? @awake[awake_min] = 1 : @awake[awake_min] += 1
    end

    start_sleeping(input)
  end

  def set_asleep_times(input)
    awake_at = Time.parse(input.match(/\d+-\d+-\d+ \d+:\d+/).to_s)
    awake_from(input)

    (@start_sleeping.min..(awake_at.min - 1)).each do |asleep_min|
      @asleep[asleep_min].nil? ? @asleep[asleep_min] = 1 : @asleep[asleep_min] += 1
    end
  end

  def minute_asleep_the_most
    r = asleep.max_by{|k,v| v}
    r[0]
  end


  def self.new_guard?(input)
    input.downcase.include?('guard')
  end

  def self.asleep_input?(input)
    input.downcase.include?('asleep')
  end

  def self.wakes_up_input?(input)
    input.downcase.include?('up')
  end

  def self.find_guard_that_sleeps_the_most(guards)
    most_sleepy_time = 0
    result = nil
    guards.each do |guard|
      total_min_asleep = guard.asleep.max_by{|k,v| v}

      if !total_min_asleep.nil? && total_min_asleep[1] > most_sleepy_time
        result = guard
        most_sleepy_time = total_min_asleep[1]
      end
    end
    result
  end

end

def load_file(file_name)
  result = []
  File.readlines(file_name).each { |line| result << line.strip }
  result
end

def solve_4_pt1(input_file)
  input = load_file(input_file)

  guards = []

  input.each do |line|
    current_guard = Guard.find_or_create(guards, line)

    current_guard.set_awake_times(line) if Guard.asleep_input?(line)
    current_guard.set_asleep_times(line) if Guard.wakes_up_input?(line)
  end

  guard = Guard.find_guard_that_sleeps_the_most(guards)
  # binding.pry

  guard.guard_number * guard.minute_asleep_the_most
end

puts solve_4_pt1('sorted_input.txt')
