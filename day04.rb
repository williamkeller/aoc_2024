class PuzzleData
  attr_reader :width, :height

  def initialize(data)
    @data = data
    @width = data[0].length
    @height = data.length
  end

  def letter_at(x, y)
    # puts "#{x}, #{y}"
    return nil if x < 0 || y < 0 || x >= @width || y >= @height

    @data[y][x]
  end
end

def transform(data)
  data.map(&:strip)
end

def part_one(data)
  pd = PuzzleData.new(data)

  directions = [
    [0, -1],  # straight up
    [1, -1],  # up right 
    [1, 0],   # right 
    [1, 1],   # down right
    [0, 1],   # down 
    [-1, 1],  # down left 
    [-1, 0],  # left 
    [-1, -1]  # up left
  ]

  found_count = 0

  (0..(pd.width)).each do |x|
    (0..(pd.height)).each do |y|
      (0..7).each do |d|
        if pd.letter_at(x, y) == 'X' &&
           pd.letter_at(x + directions[d][0],       y + directions[d][1]) == 'M' &&
           pd.letter_at(x + (directions[d][0] * 2), y + (directions[d][1] * 2)) == 'A' &&
           pd.letter_at(x + (directions[d][0] * 3), y + (directions[d][1] * 3)) == 'S'

          found_count += 1
        end
      end
    end
  end

  puts "Found: #{found_count}"
end

def part_two(data)
  pd = PuzzleData.new(data)

  directions = [
    [0, -1],  # straight up
    [1, -1],  # up right 
    [1, 0],   # right 
    [1, 1],   # down right
    [0, 1],   # down 
    [-1, 1],  # down left 
    [-1, 0],  # left 
    [-1, -1]  # up left
  ]

  found_count = 0

  (0..(pd.width)).each do |x|
    (0..(pd.height)).each do |y|
      if pd.letter_at(x, y) == 'A' &&
          ( (pd.letter_at(x - 1, y - 1) == 'M' && pd.letter_at(x + 1, y + 1) == 'S') || 
            (pd.letter_at(x - 1, y - 1) == 'S' && pd.letter_at(x + 1, y + 1) == 'M') ) &&
          ( (pd.letter_at(x - 1, y + 1) == 'M' && pd.letter_at(x + 1, y - 1) == 'S') || 
            (pd.letter_at(x - 1, y + 1) == 'S' && pd.letter_at(x + 1, y - 1) == 'M')  )

          puts "#{x},#{y}"
        found_count += 1
      end
    end
  end

  puts "Found: #{found_count}"
end


