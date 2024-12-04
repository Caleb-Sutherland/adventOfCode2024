$matrix = []

File.open("4.input.txt", "r") do |file|
  file.each_line do |line|
    row = []
    line.chomp.split("").each do |char|
      row.push(char)
    end
    $matrix.push(row)
  end
end

def isMas?(str)
  return str == "MAS" || str == "SAM"
end

def isXmas?(x, y)
  cross1 = $matrix[x-1][y-1] + $matrix[x][y] + $matrix[x+1][y+1]
  cross2 = $matrix[x+1][y-1] + $matrix[x][y] + $matrix[x-1][y+1]
  return isMas?(cross1) && isMas?(cross2)
end

$matches = 0

for i in 1...$matrix.length-1
  for j in 1...$matrix[i].length-1
    if isXmas?(i, j)
      $matches += 1
    end
  end
end

puts $matches