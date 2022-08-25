# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(sidea, sideb, sidec)
  # WRITE THIS CODE

  triangulo = [sidea, sideb, sidec]

  raise TriangleError if triangulo.min <= 0

  triangulo.sort!

  raise TriangleError if triangulo[0] + triangulo[1] <= triangulo[2]

  if sidea == sideb && sidea == sidec
    :equilateral
  elsif (sidea != sideb) && (sidea != sidec) && (sideb != sidec)
    :scalene
  else
    :isosceles
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
