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
  
  # Init a map to determine the dependency count
  dependencyCount = {}
  update.each do |num|
    dependencyCount[num] = 0
  end

  # Count up the dependencies into our map
  update.each do |num|
    if rules.key?(num)
      rules[num].each do |dep|
        if dependencyCount.key?(dep)
          dependencyCount[dep] += 1
        end
      end
    end
  end

  # Perform the update
  isValid = true
  update.each do |num|
    
    # If we have zero, it means all pages it depends on have been printed
    if dependencyCount[num] != 0
      isValid = false
      break
    end

    # When printing a page, update any dependencies
    if rules.key?(num)
      rules[num].each do |dep|
        if dependencyCount.key?(dep)
          dependencyCount[dep] -= 1
        end
      end
    end
  end

  if isValid
    total += update[update.length / 2]
  end
end

puts total
    




  
  

