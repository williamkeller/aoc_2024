def transform(data)
  rules = []
  updates = []

  data.each do |row|
    row.strip!

    if row.include? '|'
      rules << row.split(/\|/).map(&:to_i)
    elsif row.include? ','
      updates << row.split(/,/).map(&:to_i)
    end
  end

  [rules, updates]
end

def part_one(data)
  rules, updates = data
  
  score = 0

  updates.each do |update|
    still_valid = true

    rules.each do |rule|
      index_0 = update.index(rule[0])
      index_1 = update.index(rule[1])
      next if index_0.nil? || index_1.nil?
      next if index_0 < index_1

      still_valid = false
    end

    if still_valid
      score += update[update.length / 2]
    end
  end

  puts "score: #{score}"
end

def part_two(data)
  rules, updates = data
  
  score = 0

  updates.each do |update|
    still_valid = true

    # This is gross. It works, but blech.
    5.times do
      rules.each do |rule|
        index_0 = update.index(rule[0])
        index_1 = update.index(rule[1])
        next if index_0.nil? || index_1.nil?
        next if index_0 < index_1

        still_valid = false

        tmp_page = update[index_0]
        update[index_0] = update[index_1]
        update[index_1] = tmp_page
      end
    end

    unless still_valid
      score += update[update.length / 2]
    end
  end


  puts "score: #{score}"
end
