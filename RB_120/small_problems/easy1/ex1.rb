# RB120-RB129 OOP Small Problems
# Easy 1 - Problem 1 : Banner Class
# Mon. 11/16/20

# PROBLEM STATEMENT
=begin
Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
  end

  def empty_line
  end

  def message_line
    "| #{@message} |"
  end
end

Complete this class so that the test cases shown below work as intended.
You are free to add any methods or instance variables you need. However, do not
make the implementation details public.
You may assume that the input will always fit in your terminal window.

Test cases included below code.

Further Exploration
Modify this class so new will optionally let you specify a fixed banner width at
the time the Banner object is created. The message in the banner should be
centered within the banner of that width. Decide for yourself how you want to
handle widths that are either too narrow or too wide.
=end
# CODE

# class Banner
#   def initialize(message)
#     self.message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private
#   attr_accessor :message

#   def width
#     message.size + 2
#   end

#   def horizontal_rule
#     "+#{"-" * width}+"
#   end

#   def empty_line
#     "|#{" " * width}|"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# # Test Cases
# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# # +--------------------------------------------+
# # |                                            |
# # | To boldly go where no one has gone before. |
# # |                                            |
# # +--------------------------------------------+

# banner = Banner.new('')
# puts banner
# # +--+
# # |  |
# # |  |
# # |  |
# # +--+

# Further Exploration
class Banner
  MAX_WIDTH = 78

  def initialize(message, banner_width = message.size + 2)
    self.message = message
    if (banner_width < width || banner_width > MAX_WIDTH)
      self.banner_width = width
    else
      self.banner_width = banner_width
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_accessor :banner_width, :message

  def width
    message.size + 2
  end

  def horizontal_rule
    "+#{"-" * banner_width}+"
  end

  def empty_line
    "|#{" " * banner_width}|"
  end

  def message_line
    "|#{@message.center(banner_width)}|"
  end
end

# Test Cases
banner = Banner.new('To boldly go where no one has gone before.', 70)
puts banner

banner = Banner.new('', 10)
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+