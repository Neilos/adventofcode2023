# frozen_string_literal: true

require 'rspec/core'
require 'rubocop-rspec'
require 'pry'

require_relative 'digits_extractor'

RSpec.describe DigitsExtractor do
  subject(:expected_digits) { described_class.new(string).call }

  test_data = {
    '1abc2' => '12',
    'pqr3stu8vwx' => '38',
    'a1b2c3d4e5f' => '15',
    'treb7uchet' => '77',
    'two1nine' => '29',
    'eightwothree' => '83',
    'abcone2threexyz' => '13',
    'xtwone3four' => '24',
    '4nineeightseven2' => '42',
    'zoneight234' => '14',
    '7pqrstsixteen' => '76',
    'vboneight4' => '14',
    'honeight3' => '13',
    'mboneight8' => '18',
    'zoneight6' => '16',
    'jztoneight8' => '18',
    'mponeight9' => '19',
    'two6sixcsgnzqbttjdzqs39oneightd' => '28',
    '37oneightr' => '38',
    'nnsoneightd' => '18',
    'soneights' => '18',
    'sevenv1eight9cpvmrn8oneightn' => '78',
    '1oneightf' => '18',
    '7four76rklqgljhdzzhdcqrqzpxmfftbcfiveoneightj' => '78',
    'cbpvqbddlllczgfmninenine3zqvptoneightx' => '98'
  }

  test_data.each do |string_input, expected_result|
    context "when string is #{string_input}" do
      let(:string) { string_input }

      it "returns #{expected_result}" do
        expect(expected_digits).to eq(expected_result)
      end
    end
  end
end
