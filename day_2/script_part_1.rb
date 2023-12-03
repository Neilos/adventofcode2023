#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'

require_relative 'game_limits'
require_relative 'game_line_parser'

game_limits = GameLimits.new(max_red: 12, max_green: 13, max_blue: 14)

valid_game_ids = []

File.foreach('./input.txt') do |game_line|
  game = GameLineParser.new(game_line).call
  valid_game_ids << game.id if game_limits.possible?(game)
end

puts valid_game_ids.sum
