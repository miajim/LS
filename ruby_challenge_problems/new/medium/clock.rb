# LS Ruby Challenge Problems (New)
# Medium - Problem 3: Clock
# Mon. 01/25/2021

=begin
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time
represented by a given clock object. Two clock objects that represent the same
time should be equal to each other.

You may not use any built-in date or time functionality;
just use airthmetic operations.
=end

=begin
# Notes
Inputs
  -
Outputs
  -
Rules/Req's
  -
  -
  -
Questions
  -
  -
Algorithm
  - define a Clock class with the following class methods: at, to_s, +, - , ==
    and the initialize instance method
  - Clock::at(hours, mins)
    - can take two arguments: hours, minutes
      - minutes argument is optional, default to 0 minutes
    - calculate the time in minutes and store in an instance of clock
      - total_time = hours * 60 min/hour + minutes
  - Additional method: Clock::cycle(mins)
      - Take the time in minutes and divide by 1440 minutes / day
      - discard the quotient (# of days)
      - take the number of minutes and divide by 60 minutes / hour
      - quotient = # of hours in a 24 hour cycle
      - remainder = # of minutes in a 24 hour cycle
  - Clock::to_s
    - call the cycle method to calculate the time in hours & minutes
    - format the output string s.t. it looks like 'HH::MM'
  - Clock::+(mins)
    - takes one argument in minutes
    - add the minutes together
  - Clock::-(mins)
    - takes one argument in minutes
    - subtract the minutes
  - Clock::==(other_clock)
    - takes one argument
    - if the time in minutes are equal for both clock objects,
      then the clocks are the same.
=end

# CODE

class Clock
  MINUTES_PER_DAY = 1440
  MINUTES_PER_HOUR = 60

  def initialize(mins)
    @mins = mins
  end

  def self.at(hours, minutes = 0)
    total_mins = hours * 60 + minutes
    Clock.new(total_mins)
  end

  def to_s
    time = cycle(mins)
    format('%02d:%02d', time[0], time[1])
  end

  def +(int)
    Clock.new(mins + int)
  end

  def -(int)
    Clock.new(mins - int)
  end

  def ==(other_clock)
    cycle(mins) == cycle(other_clock.mins)
  end

  protected

  attr_reader :mins

  def cycle(total_mins)
    _, remaining_mins = total_mins.divmod(MINUTES_PER_DAY)
    final_hour, final_mins = remaining_mins.divmod(MINUTES_PER_HOUR)
  end
end
