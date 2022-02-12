class Triangle
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    real_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def real_triangle
    shape = [(a + b > c), (b + c > a), (a + c > b)]
    [a, b, c].each do |side|
      shape << false if side <= 0 
    raise TriangleError if shape.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end