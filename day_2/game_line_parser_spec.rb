# frozen_string_literal: true

require 'rspec/core'

require_relative 'game_line_parser'

RSpec.describe GameLineParser do
  subject(:parsed_games) { described_class.new(game_line).call }

  context 'when scenario 1' do
    let(:game_line) { 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green' }

    it 'is returns the expected game' do
      expect(parsed_games).to eq(
        Game.new(
          id: 1,
          handfuls_of_cubes: [
            HandfulOfCubes.new(blue: 3, red: 4),
            HandfulOfCubes.new(red: 1, green: 2, blue: 6),
            HandfulOfCubes.new(green: 2)
          ]
        )
      )
    end
  end

  context 'when scenario 2' do
    let(:game_line) { 'Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue' }

    it 'is returns the expected game' do
      expect(parsed_games).to eq(
        Game.new(
          id: 2,
          handfuls_of_cubes: [
            HandfulOfCubes.new(blue: 1, green: 2),
            HandfulOfCubes.new(red: 1, green: 3, blue: 4),
            HandfulOfCubes.new(green: 1, blue: 1)
          ]
        )
      )
    end
  end

  context 'when scenario 3' do
    let(:game_line) { 'Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red' }

    it 'is returns the expected game' do
      expect(parsed_games).to eq(
        Game.new(
          id: 3,
          handfuls_of_cubes: [
            HandfulOfCubes.new(green: 8, blue: 6, red: 20),
            HandfulOfCubes.new(red: 4, green: 13, blue: 5),
            HandfulOfCubes.new(green: 5, red: 1)
          ]
        )
      )
    end
  end

  context 'when scenario 4' do
    let(:game_line) { 'Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red' }

    it 'is returns the expected game' do
      expect(parsed_games).to eq(
        Game.new(
          id: 4,
          handfuls_of_cubes: [
            HandfulOfCubes.new(green: 1, blue: 6, red: 3),
            HandfulOfCubes.new(red: 6, green: 3),
            HandfulOfCubes.new(green: 3, blue: 15, red: 14)
          ]
        )
      )
    end
  end

  context 'when scenario 5' do
    let(:game_line) { 'Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green' }

    it 'is returns the expected game' do
      expect(parsed_games).to eq(
        Game.new(
          id: 5,
          handfuls_of_cubes: [
            HandfulOfCubes.new(blue: 1, red: 6, green: 3),
            HandfulOfCubes.new(red: 1, green: 2, blue: 2)
          ]
        )
      )
    end
  end
end
