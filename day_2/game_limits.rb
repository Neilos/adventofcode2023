# frozen_string_literal: true

class GameLimits
  def initialize(max_red:, max_blue:, max_green:)
    @max_red = max_red
    @max_blue = max_blue
    @max_green = max_green
  end

  def possible?(game)
    game.handfuls_of_cubes.all? do |handful_of_cubes|
      handful_of_cubes.red <= max_red &&
        handful_of_cubes.green <= max_green &&
        handful_of_cubes.blue <= max_blue
    end
  end

  private

  attr_reader :max_red,
              :max_blue,
              :max_green
end
