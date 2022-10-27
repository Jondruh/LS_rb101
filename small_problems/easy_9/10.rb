def buy_fruit(array)
  list = []
  array.each do |inner|
    inner[1].times { |_| list << inner[0] }
  end
  list
end

def buy_fruit(array)
  array.map { |fruit, quant| [fruit] * quant }.flatten
end
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
