class Triangle
  
  def initialize(side1,side2,side3)
    @side1 = side1
    @side2 = side2 
    @side3 = side3
    
  end

  def kind
    raise TriangleError if invalid_triangle?
    if @side1 == @side2 && @side2 == @side3
      :equilateral
    elsif @side1==@side2 || @side2 == @side3 || @side1 == @side3
      :isosceles
    else
      :scalene
    end
  end

  def invalid_triangle?
    no_side = [@side1,@side2,@side3].any? {|side| side <= 0}
    triangle_inequality = (@side1 + @side2 <= @side3) || (@side2 + @side3 <= @side1) || (@side1 + @side3 <= @side2)
    no_side || triangle_inequality
  end

  class TriangleError < StandardError
    
  end
end
