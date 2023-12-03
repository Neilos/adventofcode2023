#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'game_line_parser'

sum_of_powers = File.foreach('./input.txt').sum do |game_line|
  game = GameLineParser.new(game_line).call
  game.minimum_set_of_cubes.values.reduce(&:*)
end

puts sum_of_powers
