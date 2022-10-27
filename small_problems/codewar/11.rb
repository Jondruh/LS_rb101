=begin
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. For example:
domain_name("http://github.com/carbonfive/raygun") == "github
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"
=end

#PROCESS
#   Given a url string, parse out and return just domain string.
#     select the text either after "www." if this is no 'www.' select after '//'
#     stop the selection the first '.' after beginning the selection

# #ALGORITHM
#   #given a url string
#   find the index of that string that matches the start '//' or 'www.'
      #
#   find the index of that part of the string that matches '.' after the first index
#   return the part of the string between the two indexes.
require "pry"

def domain_name(url)
  index1 = if url.match('//')
             url.index('//') + 2
           elsif url.match('.')
             url.index('.') + 1
           end

  index2 = url.index('.', index1)

  url[index1...index2]
end

p domain_name("http://google.com") #== "google"
p domain_name("http://google.co.jp") #== "google"
p domain_name("www.xakep.ru") #== "xakep"
p domain_name("https://youtube.com") #== "youtube"
