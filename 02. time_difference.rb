def my_min(list)
    # O(N^2) ==> Time
    # O(1) ==> Space
    smallest_num = nil
    list.each do |n1|
        smallest_num = n1
        list.each do |n2|
            smallest_num = n2 if n2 < smallest_num
        end
    end
    smallest_num
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5

def my_min2(list)
    # O(N) ==> Time
    # O(1) ==> Space
    smallest_num = Float::INFINITY
    list.each do |n|
        smallest_num = n if n < smallest_num
    end
    smallest_num
end

p my_min2(list)  # =>  -5



def sub_arrays_of(list)
    # O(N^3) ==> Time
    # O(N^3) ==> Space
    sub_arrs = []
    len = list.length
    (0...len).each do |i| # O(N)
        (0...len).each do |j| # O(N)
            sub_arr = list[i..j] # O(N)
            sub_arrs << sub_arr unless sub_arr == []
        end
    end
    sub_arrs
end

# O(N^3) ==> Space && Time
def largest_contiguous_subsum(list)
    # O(N*M) ==> Time
    # O(N*M) ==> Space
    sub_arrs = sub_arrays_of(list) # O(N^3)
    sums = []
    sub_arrs.each do |sub_arr| ## O(N*M)
        sums << sub_arr.sum
    end
    # Get the max of the sums array
    sums.max # O(N)
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])


def largest_contiguous_subsum2(list)
    # O(N) ==> Time
    # O(1) ==> Space
    largest = list.first
    curr = list.first

    len = list.length
    (1...len).each do |i|
        curr = 0 if curr < 0 
        curr += list[i]
        largest = curr if curr > largest
    end
    largest
end

p largest_contiguous_subsum2(list)