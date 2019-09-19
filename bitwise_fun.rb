class BitwiseFun
  def initialize(size)
    @values = Array.new(size) { rand 255 }
  end

  def bytes
    @bytes ||= values.map do |value|
      value.to_s(2).rjust(8, '0')
    end
  end

  def correct?(guess)
    answer == guess
  end

  private

  attr_reader :values

  def answer
    @answer ||= values.reduce(&:^)
  end
end
