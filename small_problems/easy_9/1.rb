def greetings(name_array, hash)
  "Hello, #{name_array.join(' ')}!\
 Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
