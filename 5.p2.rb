# store a map of page -> [pages that need to be printed before it]
# for an update, gather the pages involved and modify the list of pages that are needed (because we are ignoring rules where we dont have the number)
# go through an update and check that for the next number we have already printed any numbers that it requires

require "set"

# Create a set of rules, x must be before [y]
rules = {}
updates = []
File.open("5.input.txt", "r") do |file|
  file.each_line do |line|
    if line.include?("|")
      tokens = line.chomp.split("|")
      x = Integer(tokens[0])
      y = Integer(tokens[1])

      if !rules.key?(x)
        rules[x] = Set.new([])
      end

      rules[x].add(y)
    elsif line.include?(",")
      updates.push(line.chomp.split(",").map { |s| Integer(s) })
    end
  end
end

total = 0

# Perform one update at a time
updates.each do |update|
  # Init a map from page -> [its dependencies]
  dependencies = {}
  update.each do |num|
    dependencies[num] = Set.new([])
  end

  # Add the dependencies for each page
  update.each do |num|
    if rules.key?(num)
      rules[num].each do |dep|
        if dependencies.key?(dep)
          dependencies[dep].add(num)
        end
      end
    end
  end

  beforeStr = update.join(",")

  # Sort based on the dependencies
  update.sort! { |a, b| 
    if dependencies[a].include?(b)
      1
    elsif dependencies[b].include?(a)
      -1
    else
      0
    end
  }

  # Check to see if there were any changes during the sort (that way we know that it was incorrect)
  if (beforeStr != update.join(","))
    total += update[update.length / 2]
  end
end

puts total
    




  
  

