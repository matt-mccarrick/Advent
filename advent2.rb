input = File.readlines("input/advent2.txt")

class Dimension_parser
  def initialize(input)
    @input = input
  end
  def parse
    @sides_to_use = []
    @input.each do |line|
      split_line = line.split("x")
      #puts line
      @sides_to_use << Dimension_model.new(split_line[0], split_line[1], split_line[2])
    end
    puts @sides_to_use[1].to_s
    return @sides_to_use
  end
end

class Dimension_model
  def initialize(length, width, height)
    @length = length.to_i
    @width = width.to_i
    @height = height.to_i

    #puts "l"+length +" w"+ width +" h" + height
  end
  def getSurfaceArea
    side1 = @length*@width
    #puts @length.to_s + "*" + @width.to_s + "=" + side1.to_s
    side2 = @length*@height
    #puts @length.to_s + "*" + @height.to_s + "=" + side2.to_s
    side3 = @width*@height
    #puts @width.to_s + "*" + @height.to_s + "=" + side3.to_s

    smallest = [side1, side2, side3].min

    #puts "Smallest:" + smallest.to_s

    return 2*side1 + 2*side2 + 2*side3 + smallest
  end

  def get_ribbon_length
    sides_to_use = [@length, @width, @height]
    length = 0
    sides_to_use.slice!(sides_to_use.index(sides_to_use.max))
    puts(sides_to_use.to_s)
    sides_to_use.each{|side|
      length += 2*side
    }
    length += @length * @width * @height
    return length
  end

  def to_s
    @length.to_s + " " + @width.to_s + " " + @height.to_s
  end
end

parser = Dimension_parser.new(input)
boxes = parser.parse
total_surface = 0
total_ribbon_length = 0
boxes.each do |box|
  total_surface += box.getSurfaceArea
end
puts total_surface

boxes.each {|box| total_ribbon_length += box.get_ribbon_length}

puts total_ribbon_length
