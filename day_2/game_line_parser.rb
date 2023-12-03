# frozen_string_literal: true

require_relative 'game'
require_relative 'handful_of_cubes'

class GameLineParser
  def initialize(game_string)
    @game_string = game_string
  end

  def call
    game_name, handfuls_string = game_string.split(':')

    _, id_string = game_name.split

    new_game(id_string.to_i, handfuls_string)
  end

  private

  attr_reader :game_string

  def new_game(id, handfuls_string)
    Game.new(id:, handfuls_of_cubes: handfuls_of_cubes(handfuls_string))
  end

  def handfuls_of_cubes(handfuls_string)
    handfuls_string.split(';').map do |handful_string|
      HandfulOfCubes.new(
        **handful_string.split(',').to_h do |cube_count|
          count, color = cube_count.split
          [color.to_sym, count.to_i]
        end
      )
    end
  end
end
