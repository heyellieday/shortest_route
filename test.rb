class Test

	def initialize(number)
		@num1 = number
		@num2 = number
		@num3 = number
	end

	def add
		@num1 += 1
	end

	def all_numbers
		puts @num1
		puts @num2
		puts @num3
	end
end

test = Test.new(1)
test.add
test.all_numbers
