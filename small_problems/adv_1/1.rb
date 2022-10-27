# Read in from a file some text
# plug in a randomized set of nouns, verbs adjectives and adverbs.
# print the randomized text
# Our replacement lists can be in program
# the Text needs to be out of program
#
# The %{adjective} brown %{noun} %{adverb}
# %{verb} the %{adjective} yellow
# %{noun}, who %{adverb} %{verb} his
# %{noun} and looks around.
#
require "pry"
ADJECTIVE = ["frail", "dusty", "sad", "bewildered", "responsible"]
NOUN = ["disk", "reaction", "investment", "communication", "strategy"]
VERB = ["answer", "tuck", "echo", "spell", "select"]
ADVERB = ["stealthily", "worriedly", "mostly", "intently", "speedily"]

def madlib(text)
  File.open("madlib.txt") do |file|
    file.each_line do |line|
      line.sub!("adverb", ADVERB.sample)
      line.sub!("adjective", ADJECTIVE.sample)
      line.sub!("noun", NOUN.sample)
      line.sub!("verb", VERB.sample)

      puts line.delete("{#}")
    end
  end
end

File.open('madlibs2.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUN.sample,
                      verb:      VERB.sample,
                      adjective: ADJECTIVE.sample,
                      adverb:    ADVERB.sample)
  end
end
