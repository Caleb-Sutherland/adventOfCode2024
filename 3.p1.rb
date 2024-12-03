# use regex to match uncorrupted instructions, to get the start and end index of each occurrence

def computeMultiply(str)
  tokens = str.split(",")
  num1 = Integer(tokens[0].split("(")[1])
  num2 = Integer(tokens[1][0...-1])
  return num1 * num2
end

regex = /(?:do\(\))|(?:don't\(\))|(?:mul\(\d{1,3},\d{1,3}\))/

total = 0
condition = true
File.open("3.input.txt", "r") do |file|
  file.each_line do |line|
    matches = line.scan(regex)
    matches.each do |match|
      if match === "do()"
        condition = true
      elsif match === "don't()"
        condition = false
      elsif condition
        total += computeMultiply(match)
      end
    end
  end
end

puts total