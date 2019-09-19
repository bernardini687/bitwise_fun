class BitwiseFun
  attr_accessor :score

  def initialize
    @score = 0
    @values = random_nums 2
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

  def redraw!
    self.values = random_nums(difficulty)
  end

  private

  attr_accessor :values

  def random_nums(size)
    Array.new(size) { rand 255 }
  end

  def answer
    values.reduce(&:^)
  end

  def difficulty
    case score
    when 1..4 then 2
    when 5..9 then 3 # (5..)
    end
  end
end
