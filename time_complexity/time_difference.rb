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

def second_anagram?(str1, str2) #n^2
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

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.chars.each {|ch| hash1[ch] += 1}
  str2.chars.each {|ch| hash2[ch] += 1}
  hash1 == hash2
end

def two_sum_brute(arr, target) #n^2
  arr.each_index do |i|
    arr.each_index do |j|
      next if i == j
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

def okay_to_sum?(arr, target) #nlogn
  sorted = arr.sort
  i, j = 0, sorted.length - 1

  while i < j
    case (sorted[i] + sorted[j]) <=> target
    when -1
      i += 1
    when 0
      return true
    when 1
      j -= 1
    end
  end
  false
end

def two_sum_hash?(arr, target)#n
  hash = Hash.new(false)
  arr.each do |el|
    return true if hash[target - el]
    hash[el] = true
  end
  false
end

def windows(arr, w) #n^2?
  curr_max = arr[0]
  (0..arr.length - w).each do |i|
    subarr = arr[i...(i + w)]
    window = subarr.max - subarr.min
    if window > curr_max
      curr_max = window
    end
  end
  curr_max
end
