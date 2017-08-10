#my_min

#phase 1
def my_min(arr)
  (0...arr.length).each do |idx|
    return arr[idx] if (0...arr.length).all? do |j|
      arr[idx] <= arr[j]
    end
  end

  min = arr.first
  (0...arr.length).each do |idx|
    (0...arr.length).each do |j|
      min = arr[idx] if arr[idx] <= arr[j]
      puts arr[idx]
    end
  end
  min
end

# phase 2

def my_min_iter(arr)
  result = arr[0]
  arr.each {|el| result = el if el < result}
  result
end

# Largest Contiguous Sub-sum

# phase 1

def largest_contoiguous_subsum_loops(arr)
  result = []
  # o(n^2)
  arr.each do |i|
    arr.each do |j|
      result << arr[i..j]
    end
  end
  # + o(n^3)
  result.map { |ele| ele.reduce(:+) }.max


  result = []
  # o(n^2)
  arr.each do |i|
    arr.each do |j|
      subarr = arr[i..j]
      sum = subarr.reduce(:+)
      max = sum if sum > max
    end
  end
  # + o(n^3)
  result.map { |ele| ele.reduce(:+) }.max
end

# def (not) better_version(arr)
#   result = 0  #assumes at least one positive number
#   arr.each_index do |idx|
#     (idx + 1..arr.length).each do |j|
#       sum = arr[idx..j].reduce(:+)
#       result = sum if sum > result
#     end
#   end
#   result
# end

def really_better_version(arr)
  largest = arr[0]
  current = arr[0]
  arr.each do |el|
    current = 0 if current < 0
    current += el
    largest = current if current > largest
  end
  largest
end

def first_anagram?(string, string2)
  arr = string.chars
  result = []
  arr.permutation(arr.length).each {|el| result << el.join }
  result.include?(string2)
end

def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  arr1.each_index do |i|
    arr2.each_index do |j|
      if arr1[i] == arr2[j]
        str1.sub!(arr1[i], "")
        str2.sub!(arr1[i], "")
        puts "str1 is #{str1} and i id #{i}"
        puts "str2 is #{str2} and i id #{i}"
      end
    end
  end
  str1.empty? && str2.empty?
end

def third_anagram?(str1, str2) #linearithmic
  str1.chars.sort == str2.chars.sort
end
