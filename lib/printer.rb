class Printer

  def standard_print(account)
    add_headers + format_normal_transaction(account)
  end

  def reverse_print(account)

    add_headers + format_array_transaction(reverse_date(account))
  end

  private

  def add_headers
    "date || credit || debit || balance\n"
  end

  def format_normal_transaction(account)
    formatted = account.running_balance.map do |transaction|
      template(transaction)
    end
    formatted.join("\n")
  end

  def format_array_transaction(account)
    formatted = account.map do |transaction|
      template(transaction)
    end
    formatted.join("\n")
  end

  def format_to_currency(integer)
    "%.2f" % integer.to_f
  end

  def template(transaction)
    time = format_time(transaction)
    amount = format_debit_or_credit(transaction["amount"])
    balance = format_to_currency(transaction["balance"])
    "#{time} || #{amount} || #{balance}"
  end

  def format_debit_or_credit(amount)
    if amount > 0
      format_to_currency(amount) + " ||"
    else
      "|| " + format_to_currency(amount * -1)
    end
  end

  def format_time(transaction)
      t = Time.parse(transaction["date"])
      t.strftime("%d/%m/%Y")
  end

  def reverse_date(account)
    account.running_balance.sort_by! {|transaction| transaction["date"]}
  end

end
