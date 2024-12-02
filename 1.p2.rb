
list1 = []
list2Occurences = {}
File.open("1.input.txt", "r") do |file|
  file.each_line do |line|
    nums = line.chomp.strip.split(" ")

    begin
      num1 = Integer(nums[0])
      num2 = Integer(nums[-1])
    rescue ArgumentError
      puts "Tried to convert an invalid integer!"
    end

    list1.push(num1)

    if !list2Occurences.key?(num2)
      list2Occurences[num2] = 0
    end
    list2Occurences[num2] += 1
  end
end


similarity = 0
list1.each do |a|
  if list2Occurences.key?(a)
    similarity += a * list2Occurences[a]
  end
end

puts similarity