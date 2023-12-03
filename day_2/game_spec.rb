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
end
