def part_one(data)
  regex = /mul\((\d+),(\d+)\)/

  mul_total = 0

  data.each do |row|
    until row.nil?
      md = regex.match(row)
      break if md.nil?

      mul_total += md[1].to_i * md[2].to_i
      row = md.post_match
    end
  end

  puts "Total: #{mul_total}"
end

def part_two(data)
  regex = /mul\((\d{1,3}),(\d{1,3})\)|do\(\)|don't\(\)/

  mul_total = 0

  capturing = true

  data.each do |row|
    until row.nil?
      md = row.match(regex)

      break if md.nil?

      case $~.to_s
      when 'don\'t()'
        capturing = false
      when 'do()'
        capturing = true
      else
        if capturing
          mul_total += $1.to_i * $2.to_i
        end
      end

      row = md.post_match
    end
  end

  puts "Total: #{mul_total}"
end
