require "test/unit"
require_relative './rotate_matrix'

class RotateMatrixTest < Test::Unit::TestCase
  def test_rotate_matrix
    matrix = 
    [
      [1,2,3,4],
      [5,6,7,8]
    ]

    result = [
      [4,8],
      [3,7],
      [2,6],
      [1,5]
    ]
    assert_equal result, RotateMatrix.rotate(matrix)
  end
end