# RB120-RB129 OOP Small Problems
# Debugging - Problem 6: Sorting Distances
# Mon. 12/7/20

# PROBLEM STATEMENT
=begin
When attempting to sort an array of various lengths, we are surprised to see
that an ArgumentError is raised. Make the necessary changes to our code so that
the various lengths can be properly sorted and line 62 produces the expected
output.

class Length
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  def ==(other)
    case unit
    when :km  then value == other.as_kilometers.value
    when :mi  then value == other.as_miles.value
    when :nmi then value == other.as_nautical_miles.value
    end
  end

  def <(other)
    case unit
    when :km  then value < other.as_kilometers.value
    when :mi  then value < other.as_miles.value
    when :nmi then value < other.as_nautical_miles.value
    end
  end

  def <=(other)
    self < other || self == other
  end

  def >(other)
    !(self <= other)
  end

  def >=(other)
    self > other || self == other
  end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi

Further Exploration
Working with floating point numbers always involves imprecision.
For example, you might observe the following:
Length.new(10, :km).as_nautical_miles.as_kilometers == Length.new(10, :km)
# => false

This is because converting 10 kilometers to nautical miles and then to
kilometers again yields a result of 10.0001.

This is why tests of methods that involve floating point numbers often don't
check equality but equality within a certain delta. For example, we could write
a test like the following (assuming that we also implement arithmetic methods
like Length#-):

(Length.new(10, :km).as_nautical_miles.as_kilometers -
Length.new(10, :km)).abs < 0.001 # => true

=end
# CODE

class Length
  # include Comparable

  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def as_kilometers
    convert_to(:km, { km: 1, mi: 0.6213711, nmi: 0.539957 })
  end

  def as_miles
    convert_to(:mi, { km: 1.609344, mi: 1, nmi: 0.8689762419 })
  end

  def as_nautical_miles
    convert_to(:nmi, { km: 1.8519993, mi: 1.15078, nmi: 1 })
  end

  # def ==(other)
  #   case unit
  #   when :km  then value == other.as_kilometers.value
  #   when :mi  then value == other.as_miles.value
  #   when :nmi then value == other.as_nautical_miles.value
  #   end
  # end

  # def <(other)
  #   case unit
  #   when :km  then value < other.as_kilometers.value
  #   when :mi  then value < other.as_miles.value
  #   when :nmi then value < other.as_nautical_miles.value
  #   end
  # end

  # def <=(other)
  #   self < other || self == other
  # end

  # def >(other)
  #   !(self <= other)
  # end

  # def >=(other)
  #   self > other || self == other
  # end

  # def <=>(other) # use with include Comparable (no need for custom >, ==, etc.)
  #   caller_in_miles = self.as_miles.value
  #   arg_in_miles = other.as_miles.value
  #   return -1 if caller_in_miles < arg_in_miles
  #   return 0 if caller_in_miles == arg_in_miles
  #   return 1 if caller_in_miles > arg_in_miles
  # end

  def <=>(other) # can use w/o include Comparable (no need for custom >, ==, etc.)
    case unit
    when :km then value <=> other.as_kilometers.value
    when :mi then value <=> other.as_miles.value
    when :nmi then value <=> other.as_nautical_miles.value
    end
  end

  def to_s
    "#{value} #{unit}"
  end

  private

  def convert_to(target_unit, conversion_factors)
    Length.new((value / conversion_factors[unit]).round(4), target_unit)
  end
end

# Example

puts [Length.new(1, :mi), Length.new(1, :nmi), Length.new(1, :km)].sort
# => comparison of Length with Length failed (ArgumentError)
# expected output:
# 1 km
# 1 mi
# 1 nmi