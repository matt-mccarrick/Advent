file = File.open("input/advent1.txt", "r")
@input = file.read
file.close
def partone
  @floornum = 0
  @input.each_char do |char|
    if (char == "(")
      @floornum+=1
    elsif (char == ")")
      @floornum-=1
    else
    end
  end
  puts @floornum
end

def parttwo
  @floornum = 0
  @input.each_char.with_index(1) do |char, i|
    if (char == "(")
      @floornum+=1
    elsif (char == ")")
      @floornum-=1
    else
    end
    if(@floornum < 0)
      puts i
      break
    end
  end
end
partone
parttwo
