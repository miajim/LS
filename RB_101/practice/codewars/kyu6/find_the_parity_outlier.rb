=begin
- iterate through the input array
- check if the number is even or odd
  - if the number is even, map "even" (0)
  - otherwise the number is odd, map"odd" (1)
- count the number of 0s and 1s
  - if the number of 0s is 1 --> all numbers except one are even
      - find the index of the 0
      - use this index to find the element in the input array
  - if the number of 1s is 1 --> all numbers except one are odd
      - find the index of the 1
      - use this index to find the element in the input array
- return this element
=end

# def find_outlier(integers)
#   even_or_odd = integers.map do |num|
#     num.even? ? 0 : 1
#   end

#   evens = even_or_odd.count(0)
#   # odds = even_or_odd.count(1)

#   if evens == 1
#     integers[even_or_odd.index(0)]
#   else
#     integers[even_or_odd.index(1)]
#   end
# end


# REFACTORED
# def find_outlier(integers)
#   even_or_odd = integers.map { |num| num.even? ? 0 : 1 }
#   evens = even_or_odd.count(0)
#   integers[evens == 1 ? even_or_odd.index(0) : even_or_odd.index(1)]
# end

def find_outlier(arr)
    if arr[0].odd? && (arr[1].odd? || arr[2].odd?)
       arr.select {|even_num| even_num.even?}
    elsif arr[0].even? && (arr[1].even? || arr[2].even?)
       arr.select {|odd_num| odd_num.odd?}
    end
end

p find_outlier([0, 1, 2]) #== 1
p find_outlier([1, 2, 3]) #== 2
p find_outlier([2,6,8,10,3]) #== 3
