def transform(data)
  left = []
  right = []

  data.each do |line|
    line =~ /(\d*)\s*(\d*)/
    left << $1.to_i
    right << $2.to_i
  end

  [left.sort, right.sort]
end

def part_one(data)
  left, right = data
  dists = []

  left.each_with_index do |l, i|
    r = right[i]
    dists << (l - r).abs
  end

  puts dists.sum
end

def part_two(data)
  left, right = data
  dists = []

  left.each_with_index do |l, i|
    count = right.count(l)
    dists << (l * count).abs
  end

  puts dists.sum
end
