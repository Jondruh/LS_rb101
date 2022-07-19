munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_value do |info|
  case info["age"]
  when 0..17
    info["age_group"] = "kid"
  when 18..64
    info["age_group"] = "adult"
  else
    info["age_group"] = "senior"
  end
end

# munsters.each do |person, info|
#   if (0..17).include?(info["age"])
#     info["age_group"] = "kid"
#   elsif (18..64).include?(info["age"])
#     info["age_group"] = "adult"
#   elsif info["age"] >= 65
#     info["age_group"] = "senior"
#   end
# end

p munsters


