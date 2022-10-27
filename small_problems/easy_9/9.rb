def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3) / 3
  
  case 
  when average >= 90
    return 'A'
  when average >= 80
    return 'B'
  when average >= 70
    return 'C'
  when average >= 60
    return 'D'
  else
    'F'
  end
  
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
