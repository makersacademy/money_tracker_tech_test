class Statement 

  attr_reader :tracker

  def initialize(tracker = Tracker.new)
    @tracker = tracker
  end

  def compose_line(date, credit, debit, balance)
    line = []
    line[0] = date
    line[1] = credit.nil? ? "" : credit
    line[2] = debit.nil? ? "" : debit
    line[3] = balance
    line.join(" || ")
  end

  def compose_body
    body = []
    @tracker.account.entries.each do |entry|
      body << compose_line(entry.date, entry.credit, entry.debit, @tracker.get_current_balance(@tracker.account, entry))
    end 
    body.join("\n")
  end

  def print_header
    puts "date || credit || debit || balance"
  end

  def print_body
    puts compose_body
  end

  def print(tracker)
    print_header
    print_body
  end
end
