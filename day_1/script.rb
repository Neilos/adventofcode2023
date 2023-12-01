#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'

sum_of_calibration_values = File.foreach('./input.txt').sum(0) do |line|
  string_ints = line.scan(/\d/)
  calibration_value = string_ints.first + string_ints.last

  raise 'invalid calibration_value' unless calibration_value.length == 2

  calibration_value.to_i
end

puts sum_of_calibration_values
