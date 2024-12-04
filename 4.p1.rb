$matrix = []

File.open("4.input.txt", "r") do |file|
  file.each_line do |line|
    row = []
    line.split("").each do |char|
      row.push(char)
    end
    $matrix.push(row)
  end
end

$matches = 0

def scan(x, y, xInc, yInc, word, index=0)
  if (x < 0 || x >= $matrix.length || y < 0 || y >= $matrix[x].length || $matrix[x][y] != word[index])
    return
  end

  if (index == word.length-1)
    $matches += 1
    return
  end

  scan(x + xInc, y + yInc, xInc, yInc, word, index+1)
end

word = "XMAS"
for i in 0...$matrix.length
  for j in 0...$matrix[i].length
    scan(i, j, 1, 0, word)
    scan(i, j, 1, 1, word)
    scan(i, j, 1, -1, word)

    scan(i, j, 0, 1, word)
    scan(i, j, 0, -1, word)

    scan(i, j, -1, 0, word)
    scan(i, j, -1, 1, word)
    scan(i, j, -1, -1, word)
  end
end

puts $matches