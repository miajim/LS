=begin
11/2/20
Srdjan-led study session

# Given an array of n positive integers and a positive integer s, find the
minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

# Notes
Inputs
  - one array (n) with positive integers > 0
  - one positive integer (s)
Outputs
  - min. length of continguous subarray where sum of the subarray >= s
Rules/Req's
  - if there is no contiguous subarray where the sum >= s, return 0
  - min subarray length = 1
  -
Questions
  -
  -
Algorithm
  - create subarrays of length 1
  - create subarrays of length 2
  - create subarrays of length 3, etc. up to the length of the input array
    - use a nested loop to generate subarrays, starting at index 0
    - outer loop can control the length of the subarray
      - outer loop will start at 1, end at length of the input array
    - inner loop can control the starting index
      - inner loop can start at 0, ending at the length of the input array
        minus the current length of the subarray
  - for each subarray created of length x,
    - sum the values in the subarray and compare to the integer s
    - if the sum >= s, then return length x
  - otherwise return 0 once all subarrays are created (means there is no subarray
    whose sum >= s)
=end

def minSubLength(n, s)
  (1..n.size).each do |len|
    (0..(n.size - len)).each do |start_i|
      return len if n[start_i, len].sum >= s
    end
  end
  0
end

p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0