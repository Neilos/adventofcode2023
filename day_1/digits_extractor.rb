# frozen_string_literal: true

class DigitsExtractor
  DIGIT_REGEX = {
    '0' => /zero|0/,
    '1' => /one|1/,
    '2' => /two|2/,
    '3' => /three|3/,
    '4' => /four|4/,
    '5' => /five|5/,
    '6' => /six|6/,
    '7' => /seven|7/,
    '8' => /eight|8/,
    '9' => /nine|9/
  }.freeze

  def initialize(string)
    @string = string
    @first_digit = nil
    @first_digit_index = Float::INFINITY
    @last_digit = nil
    @last_digit_index = -1
  end

  def call
    DIGIT_REGEX.each do |digit, regex|
      update_first_and_last_digits(digit, regex)
    end

    [first_digit, last_digit].join
  end

  private

  attr_reader :string

  attr_accessor :first_digit,
                :first_digit_index,
                :last_digit,
                :last_digit_index

  def update_first_and_last_digits(digit, regex)
    index_of_first_occurrence = get_first_index(regex)

    return unless index_of_first_occurrence

    if index_of_first_occurrence < first_digit_index
      self.first_digit = digit
      self.first_digit_index = index_of_first_occurrence
    end

    index_of_last_occurrence = get_last_index(regex)

    return unless index_of_last_occurrence > last_digit_index

    self.last_digit = digit
    self.last_digit_index = index_of_last_occurrence
  end

  def get_indexes(digit); end

  def get_first_index(regex)
    string.index(regex)
  end

  def get_last_index(regex)
    index_of_last_occurrence = -1

    count_of_matches(regex).times do
      index_of_last_occurrence = string.index(regex, index_of_last_occurrence + 1)
    end

    index_of_last_occurrence
  end

  def count_of_matches(regex)
    string.scan(regex).count
  end
end
