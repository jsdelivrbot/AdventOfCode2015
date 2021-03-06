# parses encoded directions
class DirectionParser
  attr_reader :floor, :directions
  def initialize(directions)
    @directions = directions
    @floor = calculate_floor_from_poop
  end

  def calculate_floor_from_poop
    up = directions.count('(')
    down = directions.count(')')
    up - down
  end

  def first_negative_instruction_number
    floor = 0
    directions.split('').each_with_index do |direction, index|
      return index if floor == -1
      if direction == '('
        floor += 1
      else
        floor -= 1
      end
    end
  end
end

dp = DirectionParser.new(File.read('directions.txt')
puts dp.first_negative_instruction_number
