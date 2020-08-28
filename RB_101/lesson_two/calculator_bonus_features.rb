# RB101-RB109 Lesson 2: Small Problems
# Assignment: Calculator Bonus Features
# Thurs. 08/27/20

# Ask the user for two numbers
# Ask the user for an operation to perform
# Perform the operation on the two numbers
# Output the result

# Extracting messages in the pgoram to a configuration file
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, language = LANGUAGE)
  MESSAGES[language][message]
end
  
# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(key)
    message = messages(key, LANGUAGE)
    Kernel.print("#{message}")
end

# def valid_number?(num)
#   num.to_i() != 0 
# end

# 1) Better integer validation 
  # Using codepoints
  # def valid_number?(num)
  #   # Determine the codepoint value for each character in the string
  #   # If the codepoint is in this range (48..57) it is a number 0-9
  #   # Otherwise it isn't a number
    
  #   num_valid = true
  #   num.each_codepoint do |codepoint|
  #     if ((codepoint < 48) || (codepoint > 57))
  #       num_valid = false
  #       break
  #     end
  #   end
  #   return num_valid
  # end

  # Using RegExp
  def valid_number?(num)
    num.match?(/^-?\d+$/) # RegExp shorthand \d corresponds to anything that is a digit (0-9)
  end
  
  
  # 2) Number Validation
  def number?(num)
    num.match?(/^-?\d+\. ?\d*$/) # Caveat: Decimal numbers between -1 and 1 must start with 0
  end

# Operation to Message refactored
def operation_to_message(op)
  op_message = case op
    when '1'
      'Adding'
    when '2'
      'Subtracting'
    when '3'
      'Multiplying'
    when '4'
      'Dividing'
    end
  return op_message
end

prompt("welcome")

name = ''

loop do
    name = Kernel.gets().chomp()
    if name.empty?
      prompt(MESSAGES["valid_name"])
    else
      break
    end
end

# prompt "Hi, #{name}!"
prompt("greeting")
puts "#{name}!"

loop do # main loop

  number1 = ''
  loop do
    prompt("num1")
    number1 = Kernel.gets().chomp()  # recall: gets returns a string
    
    if number?(number1)
      break
    else
      prompt("valid_number")
    end 
  end 
  
  number2 = ''
  loop do 
    prompt("num2")
    number2 = Kernel.gets().chomp()  # recall: gets returns a string
    
      if number?(number2)
        break
      else
        prompt("valid_number")
      end 
  end 
 
  prompt("operator_prompt")
  
  operator =''
  
  loop do 
    operator = Kernel.gets().chomp()
    
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("valid_operator")
    end
  end
  
print("#{operation_to_message(operator)}") 
prompt("calculating")
  
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end 
            
  prompt("result")
  puts "#{result}."
  
  prompt("calc_again")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("goodbye")