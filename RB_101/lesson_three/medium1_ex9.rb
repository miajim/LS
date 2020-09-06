# RB101-RB109 Lesson 3
# Practice Problems - Medium 1: Question 9
# Sat. 09/05/20

# PROBLEM STATEMENT
=begin
Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
What would be the return value of the following method invocation?

bar(foo)
=end

# CODE
# evaluate foo first --> yes
# bar("yes") --> "no"

# LS Solution
# (same)