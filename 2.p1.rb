
safeReports = 0
File.open("2.input.txt", "r") do |file|
  file.each_line do |line|
    nums = line.chomp.strip.split(" ")
    begin
      if nums.length < 2
        safeReports += 1
      else
        prevDiff = nil
        isValid = true
        for index in 1...nums.length
          prevNum = Integer(nums[index-1])
          currNum = Integer(nums[index])
          currDiff = currNum - prevNum
          if !((prevDiff.nil? || (currDiff < 0 && prevDiff < 0) || (currDiff > 0 && prevDiff > 0)) && currDiff.abs >= 1 && currDiff.abs <= 3)
            isValid = false
            break
          end

          prevDiff = currDiff
        end

        if isValid
          safeReports += 1
        end
      end
    rescue ArgumentError
      puts "Tried to convert an invalid integer!"
    end
  end
end

puts safeReports