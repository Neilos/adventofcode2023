# frozen_string_literal: true

require 'rspec/core'
require 'pry'
require_relative 'game_limits'
require_relative 'game'
require_relative 'handful_of_cubes'

RSpec.describe GameLimits do
  let(:game_limits) { described_class.new(**limits) }

  let(:limits) { { max_red: 12, max_green: 13, max_blue: 14 } }

  describe 'possible?' do
    subject(:game_possibility) { game_limits.possible?(game) }

    context 'when scenario 1' do
      let(:game) do
        Game.new(
          id: 1,
          handfuls_of_cubes: [
            HandfulOfCubes.new(blue: 3, red: 4),
            HandfulOfCubes.new(red: 1, green: 2, blue: 6),
            HandfulOfCubes.new(green: 2)
          ]
        )
      end

      it 'is possible' do
        expect(game_possibility).to be(true)
      end
    end

    context 'when scenario 2' do
      let(:game) do
        Game.new(
          id: 2,
          handfuls_of_cubes: [
            HandfulOfCubes.new(blue: 1, green: 2),
            HandfulOfCubes.new(red: 1, green: 3, blue: 4),
            HandfulOfCubes.new(green: 1, blue: 1)
          ]
        )
      end

      it 'is possible' do
        expect(game_possibility).to be(true)
      end
    end

    context 'when scenario 3' do
      let(:game) do
        Game.new(
          id: 3,
          handfuls_of_cubes: [
            HandfulOfCubes.new(green: 8, blue: 6, red: 20),
            HandfulOfCubes.new(red: 4, green: 13, blue: 5),
            HandfulOfCubes.new(green: 5, red: 1)
          ]
        )
      end

      it 'is impossible' do
        expect(game_possibility).to be(false)
      end
    end

    context 'when scenario 4' do
      let(:game) do
        Game.new(
          id: 4,
          handfuls_of_cubes: [
            HandfulOfCubes.new(green: 1, blue: 6, red: 3),
            HandfulOfCubes.new(red: 6, green: 3),
            HandfulOfCubes.new(green: 3, blue: 15, red: 14)
          ]
        )
      end

      it 'is impossible' do
        expect(game_possibility).to be(false)
      end
    end

    context 'when scenario 5' do
      let(:game) do
        Game.new(
          id: 5,
          handfuls_of_cubes: [
            HandfulOfCubes.new(blue: 1, red: 6, green: 3),
            HandfulOfCubes.new(red: 1, green: 2, blue: 2)
          ]
        )
      end

      it 'is possible' do
        expect(game_possibility).to be(true)
      end
    end
  end
end
