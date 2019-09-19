class BitwiseFun
  attr_reader :score

  def initialize(size)
    @values = random_nums(size)
    @score = 0
  end

  def bytes
    values.map do |value|
      value.to_s(2).rjust(8, '0')
    end
  end

  def correct?(guess)
    # `guess` should be in binary
    answer == guess.to_i(2)
  end

  def redraw!(size)
    self.score += 1
    initialize(size)
  end

  private

  attr_reader :values
  attr_writer :score

  def random_nums(size)
    Array.new(size) { rand 255 }
  end

  def answer
    values.reduce(&:^)
  end
end
