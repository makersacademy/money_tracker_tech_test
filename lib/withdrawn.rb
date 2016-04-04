class Withdrawn
	attr_reader :transactions
	def initialize
		@transactions = []
	end

	# def transactions
	# 	transactions.dup
	# end
end