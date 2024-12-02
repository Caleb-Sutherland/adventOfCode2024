
list1 = []
list2 = []
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
    list2.push(num2)
  end
end

list1.sort!
list2.sort!

total = 0
list1.zip(list2) do |a, b|
  total += (a-b).abs
end

puts total