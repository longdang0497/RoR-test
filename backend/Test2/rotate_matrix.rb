class RotateMatrix 

  def self.flip_vertically(matrix)
    rows = matrix.size
    cols = matrix.first.size
    (0...cols).each do |j|
      (0...rows/2).each do |i|
        temp = matrix[i][j]
        matrix[i][j] = matrix[rows-1-i][j]
        matrix[rows-1-i][j] = temp
      end 
    end
  end 

  def self.rotate(matrix)
    rows = matrix.size
    cols = matrix.first.size
  
    result = Array.new(cols) { Array.new(rows) }
    (0...rows).each do |i|
      (0...cols).each do |j|
        result[j][i] = matrix[i][j]
      end
    end
  
    RotateMatrix.flip_vertically(result)
    result.each {|r| puts r.inspect}
  end 
end 