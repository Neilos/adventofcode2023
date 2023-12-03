# frozen_string_literal: true

require 'rspec/core'

require_relative 'game'
require_relative 'handful_of_cubes'

RSpec.describe Game do
  let(:game) { described_class.new(id:, handfuls_of_cubes:) }

  let(:id) { 4 }
  let(:handfuls_of_cubes) do
    [
      HandfulOfCubes.new(red: 2, blue: 4),
      HandfulOfCubes.new(red: 5, blue: 8, green: 3)
    ]
  end

  describe 'id' do
    subject(:game_id) { game.id }

    it 'is the given id' do
      expect(game_id).to eq(id)
    end
  end

  describe 'handfuls_of_cubes' do
    subject(:game_handfuls_of_cubes) { game.handfuls_of_cubes }

    it 'is the given handfuls_of_cubes' do
      expect(game_handfuls_of_cubes).to eq(handfuls_of_cubes)
    end
  end

  describe 'minimum_set_of_cubes' do
    subject(:minimum_set_of_cubes) { game.minimum_set_of_cubes }

    context 'when game 1' do
      let(:game) do
        described_class.new(
          id: 1,
          handfuls_of_cubes: [
            HandfulOfCubes.new(blue: 3, red: 4),
            HandfulOfCubes.new(red: 1, green: 2, blue: 6),
            HandfulOfCubes.new(green: 2)
          ]
        )
      end

      it 'is as expected' do
        expect(minimum_set_of_cubes).to eq(
          {
            red: 4,
            green: 2,
            blue: 6
          }
        )
      end
    end

    context 'when game 2' do
      let(:game) do
        described_class.new(
          id: 2,
          handfuls_of_cubes: [
            HandfulOfCubes.new(blue: 1, green: 2),
            HandfulOfCubes.new(red: 1, green: 3, blue: 4),
            HandfulOfCubes.new(green: 1, blue: 1)
          ]
        )
      end

      it 'is as expected' do
        expect(minimum_set_of_cubes).to eq(
          {
            red: 1,
            green: 3,
            blue: 4
          }
        )
      end
    end

    context 'when game 3' do
      let(:game) do
        described_class.new(
          id: 3,
          handfuls_of_cubes: [
            HandfulOfCubes.new(green: 8, blue: 6, red: 20),
            HandfulOfCubes.new(red: 4, green: 13, blue: 5),
            HandfulOfCubes.new(green: 5, red: 1)
          ]
        )
      end

      it 'is as expected' do
        expect(minimum_set_of_cubes).to eq(
          {
            red: 20,
            green: 13,
            blue: 6
          }
        )
      end
    end

    context 'when game 4' do
      let(:game) do
        described_class.new(
          id: 4,
          handfuls_of_cubes: [
            HandfulOfCubes.new(green: 1, blue: 6, red: 3),
            HandfulOfCubes.new(red: 6, green: 3),
            HandfulOfCubes.new(green: 3, blue: 15, red: 14)
          ]
        )
      end

      it 'is as expected' do
        expect(minimum_set_of_cubes).to eq(
          {
            red: 14,
            green: 3,
            blue: 15
          }
        )
      end
    end

    context 'when game 5' do
      let(:game) do
        described_class.new(
          id: 5,
          handfuls_of_cubes: [
            HandfulOfCubes.new(blue: 1, red: 6, green: 3),
            HandfulOfCubes.new(red: 1, green: 2, blue: 2)
          ]
        )
      end

      it 'is as expected' do
        expect(minimum_set_of_cubes).to eq(
          {
            red: 6,
            green: 3,
            blue: 2
          }
        )
      end
    end
  end
end
