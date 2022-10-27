def sequence(size, num)
  seq = []
  size.times do |counter|
    seq << num * (counter + 1)
  end
  seq
end

def sequence(size, num)
  (1..size).map { |value| value * num }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
