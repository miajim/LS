# RB120-RB129 OOP Small Problems
# Debugging - Problem 10 : Does it Rock or Not?
# Mon. 12/7/20

# PROBLEM STATEMENT
=begin
We discovered Gary Bernhardt's repository for finding out whether something
rocks or not, and decided to adapt it for a simple example.

class AuthenticationError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      positive / (positive + negative)
    rescue Exception
      NoScore
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

In order to test the case when authentication fails, we can simply set API_KEY
to any string other than the correct key. Now, when using a wrong API key, we
want our mock search engine to raise an AuthenticationError, and we want the
find_out method to catch this error and print its error message API key is
not valid.

Is this what you expect to happen given the code?

And why do we always get the following output instead?
Sushi rocks!
Rain rocks!
Bug hunting rocks!

=end
# CODE
class AuthenticationError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

# module DoesItRock
#   # API_KEY = 'LS1A'
#   API_KEY = 'LS2A'

#   class NoScore; end

#   class Score
#     def self.for_term(term)
#       positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
#       negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

#       puts positive, negative

#       positive / (positive + negative)
#     rescue Exception
#       NoScore
#     end
#   end

#   def self.find_out(term)
#     score = Score.for_term(term)
#     # p score

#     case score
#     when NoScore
#       "No idea about #{term}..."
#     when 0...0.5
#       "#{term} is not fun."
#     when 0.5#...1
#       "#{term} seems to be ok..."
#     else
#       "#{term} rocks!"
#     end
#   rescue Exception => e
#     e.message
#   end
# end

# LS Solution (AuthenticationError and SearchEngine classes remain the same)
module DoesItRock
  API_KEY = 'LS2A' # 'wrong key'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      positive / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5..1
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!
# p DoesItRock::NoScore.ancestors

=begin
My hypothesis:
The return value of SearchEngine::count is always going to be a random number
between 0 and 200,000 since it is the last line executed by the method.
I think you have to use an unless-else conditional to assign the return value
of the raise method call to the positive and negative local variables within the
DoesItRock::for_term method.

I tested this hypothesis and it is incorrect; adding an unless-else (or if-else)
conditional does not affect the final output. After some testing in irb, it
appears that the local variable score within Module::find_out points to
DoesItRock::Score when the API_KEY value is invalid. When it compares the
score (DoesItRock::NoScore) to NoScore in the case statment, Ruby treats
NoScore as a constant and therefore the class NoScore is overlooked.
Being more specific about NoScore (i.e., changing it to DoesItRock::NoScore)
within the case statement still doesn't cause the branch to execute, even though
recall that local variable score is pointing to DoesItRock::NoScore. I think
this is happening because of the way that the case statement performs the
comparison (using ===). If == is used instead, then this branch will execute.

Why does score point to DoesItRock::Score ?
=end