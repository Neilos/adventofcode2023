#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'digits_extractor'

sum_of_calibration_values = File.foreach('./input.txt').sum do |line|
  DigitsExtractor.new(line).call.to_i
end

puts sum_of_calibration_values
