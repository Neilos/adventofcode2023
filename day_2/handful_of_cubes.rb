# frozen_string_literal: true

class HandfulOfCubes
  def initialize(red: 0, green: 0, blue: 0)
    @red = red
    @green = green
    @blue = blue
  end

  attr_reader :red, :blue, :green

  def ==(other)
    other.red == red &&
      other.green == green &&
      other.blue == blue
  end
end
