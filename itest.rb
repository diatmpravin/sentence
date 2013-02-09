class Unknown
  def initialize(text)
    # Initalize hash    
    @words = Hash.new

    # Spliting text and collect into Array. 
    wordlist = text.split
    
    # Grab each Array value with index
    wordlist.each_with_index do |word, index|
      # call ADD method with parameters,checked before index should less than and equlas to  Array size -2
      add(word, wordlist[index + 1]) if index <= wordlist.size - 2
    end
  
  end

  def add(word, next_word)
    
    # Initalize hash having default value '0', if hash not exist with requested word as key 
    @words[word] = Hash.new(0) if !@words[word]

    # Increment value of next_word by 1,respective of key 'word'
    @words[word][next_word] += 1
    
  end

  def get(word)

    # collect hash of requested word
    @words[word]
    
    return "" if !@words[word]
    
    followers = @words[word]
    
    # Sum up all key's value on sum variable
    sum = followers.inject(0) { |sum, kv| sum += kv[1] }

    # generate randon number with sum by incrementing 1, discard ZERO to avoid flot values
    random = rand(sum)+1
    partial_sum = 0
    
    # collect first key and value, whose value greater than random number
    next_word = followers.find do |word, count|
      partial_sum += count
      partial_sum >= random
    end.first
    
    # return next_word 
    next_word
  end
end

# Initalize class and read file from root dir.
unknown = Unknown.new(
    File.read("a.txt")
)

# Initalize empty string
sentence = ""

# Initalize string with first word "HealthFix"
word = "HealthFix"

# loop until sentence having 4 dot.
until sentence.count(".") == 4
  p word

  # Add 'word' to the sentence with one space
  sentence << word << " "

  # call 'get' method with current word, will return new word
  word = unknown.get(word)
end

# append two new lines at end of sentence.
puts sentence << "\n\n"
