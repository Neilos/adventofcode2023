# frozen_string_literal: true

Game = Struct.new(:id, :handfuls_of_cubes, keyword_init: true) do
  def minimum_set_of_cubes
    {
      red: handfuls_of_cubes.max_by(&:red).red,
      green: handfuls_of_cubes.max_by(&:green).green,
      blue: handfuls_of_cubes.max_by(&:blue).blue
    }
  end
end
