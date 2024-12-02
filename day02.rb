def transform(data)
  data.map do |row|
    row.split.map { |e| e.strip.to_i }
  end
end

def safe?(report, d_min, d_max)
  (1...(report.length)).each do |i|
    diff = report[i] - report[i - 1]
    
    unless diff.between? d_min, d_max
      return false
      break
    end
  end

  true
end

def part_one(data)
  safe_count = 0 

  data.each do |report|
    next if report.length == 0

    if report[0] < report[-1]
      d_min = 1
      d_max = 3
    else
      d_min = -3
      d_max = -1
    end

    safe_count += 1 if safe?(report, d_min, d_max)
  end

  puts "Safe count: #{safe_count}"
end

def part_two(data)
  safe_count = 0 

  data.each do |report|
    next if report.length == 0

    if report[0] < report[-1]
      d_min = 1
      d_max = 3
    else
      d_min = -3
      d_max = -1
    end

    if safe?(report, d_min, d_max)
      safe_count += 1
    else
      (0...report.length).each do |i|
        duped = report.dup
        duped.delete_at i

        if safe?(duped, d_min, d_max)
          safe_count += 1
          break
        end
      end
    end
  end

  puts "Safe count: #{safe_count}"
end
