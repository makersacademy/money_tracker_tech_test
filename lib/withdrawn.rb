class Withdrawn
	attr_reader :transactions
	def initialize
		@transactions = []
	end

	# def transactions
	# 	transactions.dup
	# end

	def store(amount)
		@transactions << {amount => get_date}
	end

	def get_date
		Time.now.to_s.split(' ')[0].split('-').reverse.join('/')
	end
end