class Counter
	attr_accessor :file 

	def initialize file 
		@file = file 
		File.foreach(file).with_index do |line, line_num|
			if line_num == 0
				@from = line.delete!("\n")
			elsif  line_num == 1 
				@to = line 
			end 
		end
		
	end 

	def palindromes_count 
		range_array = (@from.to_i ..@to.to_i).to_a
		palindromes_array = Array.new 
		range_array.each do |i|
			str = i.to_s 
			if str == str.reverse
				palindromes_array << str.to_i
			end 
		end 
		count = palindromes_array.count
		puts "File checked: #{file}\n Range: #{@from}..#{@to}\n Palindromes: #{count} \n ================" 
	end 
end 


example = Counter.new("test_files/example.txt") 
example.palindromes_count

test_1 = Counter.new("test_files/test-1.txt")
test_1.palindromes_count

test_2 = Counter.new("test_files/test-2.txt")
test_2.palindromes_count

another_test = Counter.new("test_files/another-test.txt")
another_test.palindromes_count