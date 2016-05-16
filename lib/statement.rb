
class Statement

	attr_reader :balance, :transactions

	def initialize 
		@balance = 0
		@transactions = Hash.new
	end
end