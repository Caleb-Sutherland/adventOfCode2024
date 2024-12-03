
# Can try each row n times, removing each element once
# is there a smarter way?

def isSafe?(nums)
  if nums.length < 2
    return true
  end

  prevDiff = nil
  for index in 1...nums.length
    begin
      prevNum = Integer(nums[index-1])
      currNum = Integer(nums[index])
      currDiff = currNum - prevNum
      if !((prevDiff.nil? || (currDiff < 0 && prevDiff < 0) || (currDiff > 0 && prevDiff > 0)) && currDiff.abs >= 1 && currDiff.abs <= 3)
        return false
      end

      prevDiff = currDiff
    rescue ArgumentError
      puts "Tried to convert an invalid integer!"
    end
  end
  return true
end

safeReports = 0
File.open("2.input.txt", "r") do |file|
  file.each_line do |line|
    nums = line.chomp.strip.split(" ")
    if isSafe?(nums)
      safeReports += 1
    else
      for i in 0...nums.length
        if isSafe?(nums[0...i] + nums[i+1..])
          safeReports += 1
          break
        end
      end
    end 
  end
end

puts safeReports